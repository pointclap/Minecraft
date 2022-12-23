#!/bin/sh
# Script used to install Forge as part of the image building process.

FILE=./libraries/net/minecraftforge/forge/${VERSION}-${FORGE_VERSION}
if [ ! -d "${FILE}" ]; then
    echo "Installing Minecraft Forge Server."
    java -Dfml.queryResult=confirm -jar ./forge-${VERSION}-${FORGE_VERSION}-installer.jar --installServer
fi

# Clean up
if [ -d "${FILE}" ]; then
    echo "Deleting the installer file."
    rm forge-${VERSION}-${FORGE_VERSION}-installer.jar
fi
if [ -f "forge-${VERSION}-${FORGE_VERSION}-installer.jar.log" ]; then
    echo "Deleting the unnecessary file."
    rm forge-${VERSION}-${FORGE_VERSION}-installer.jar.log
fi
