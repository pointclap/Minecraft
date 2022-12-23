#!/usr/bin/env bash

repository=registry.pointclap.org/minecraft/valhelsia5

# Downloads the latest available backup from the running mc-valhelsia5 server.
function download_latest_backup() {
    namespace=pointclap
    app_selector=mc-valhelsia5
    pod_name=$(kubectl get pods -n $namespace -l app=$app_selector -o jsonpath='{.items[0].metadata.name}')

    latest_backup=$(kubectl exec -n $namespace $pod_name -- ls /data/simplebackups | sort | tail -n1)

    rm -f backup.zip

    echo "Downloading $latest_backup"
    kubectl cp -n $namespace $pod_name:"/data/simplebackups/$latest_backup" backup.zip

    rm -rf world
    unzip backup.zip
    rm backup.zip
}

# Build and push the docker image.
function build() {
    docker build \
        -t $repository:latest .

    # Tag the image using the modpack version as well.
    modpack_version=$(docker inspect $repository:latest --format '{{index .Config.Labels "org.pointclap.mc.modpack.version"}}')
    docker tag $repository:latest $repository:$modpack_version && docker push $repository:$modpack_version
}

# Run the given image locally for testing.
function run() {
    docker run --rm -it             \
        -e INIT_MEMORY=8G           \
        -e MAX_MEMORY=16G           \
        -p 127.0.0.1:25565:25565    \
        -v $(pwd)/world:/data/world \
        $repository:latest
}

case $1 in
    build)
        build
    ;;
    run)
        run
    ;;
    fetch-backup)
        download_latest_backup
    ;;
    *)
        echo "Unknown command: $1"
        echo "cli.sh

Utiltiy functions for building and testing the valhelsia image.

commands:
    build
        builds the valhelsia5 docker image.

    run
        runs the valhelsia5 docker image as a local server.

    fetch-backup
        downloads the latest backup from the live server.
"
    ;;
esac
