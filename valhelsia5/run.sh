#!/bin/sh
# Customized Valhelsia 5 Server Startup Script

JVM_ARGUMENTS=""
JVM_ARGUMENTS="$JVM_ARGUMENTS -Xms${INIT_MEMORY}"
JVM_ARGUMENTS="$JVM_ARGUMENTS -Xmx${MAX_MEMORY}"
JVM_ARGUMENTS="$JVM_ARGUMENTS -XX:+UseG1GC"
JVM_ARGUMENTS="$JVM_ARGUMENTS -XX:+ParallelRefProcEnabled"
JVM_ARGUMENTS="$JVM_ARGUMENTS -XX:MaxGCPauseMillis=200"
JVM_ARGUMENTS="$JVM_ARGUMENTS -XX:+UnlockExperimentalVMOptions"
JVM_ARGUMENTS="$JVM_ARGUMENTS -XX:+DisableExplicitGC"
JVM_ARGUMENTS="$JVM_ARGUMENTS -XX:+AlwaysPreTouch"
JVM_ARGUMENTS="$JVM_ARGUMENTS -XX:G1NewSizePercent=40"
JVM_ARGUMENTS="$JVM_ARGUMENTS -XX:G1MaxNewSizePercent=50"
JVM_ARGUMENTS="$JVM_ARGUMENTS -XX:G1HeapRegionSize=16M"
JVM_ARGUMENTS="$JVM_ARGUMENTS -XX:G1ReservePercent=15"
JVM_ARGUMENTS="$JVM_ARGUMENTS -XX:G1HeapWastePercent=5"
JVM_ARGUMENTS="$JVM_ARGUMENTS -XX:G1MixedGCCountTarget=4"
JVM_ARGUMENTS="$JVM_ARGUMENTS -XX:InitiatingHeapOccupancyPercent=20"
JVM_ARGUMENTS="$JVM_ARGUMENTS -XX:G1MixedGCLiveThresholdPercent=90"
JVM_ARGUMENTS="$JVM_ARGUMENTS -XX:G1RSetUpdatingPauseTimePercent=5"
JVM_ARGUMENTS="$JVM_ARGUMENTS -XX:SurvivorRatio=32"
JVM_ARGUMENTS="$JVM_ARGUMENTS -XX:+PerfDisableSharedMem"
JVM_ARGUMENTS="$JVM_ARGUMENTS -XX:MaxTenuringThreshold=1"
JVM_ARGUMENTS="$JVM_ARGUMENTS -Dusing.aikars.flags=https://mcflags.emc.gs"
JVM_ARGUMENTS="$JVM_ARGUMENTS -Daikars.new.flags=true"

echo "Starting Valhelsia 5 Server."
java ${JVM_ARGUMENTS} @/data/libraries/net/minecraftforge/forge/${VERSION}-${FORGE_VERSION}/unix_args.txt nogui
