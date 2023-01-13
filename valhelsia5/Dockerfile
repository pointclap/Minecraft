FROM itzg/minecraft-server:java17-alpine


ENV VALHELSIA_VERSION=5.0.12

# Accept EULA
ENV EULA=true

# While building the image, run the server in SETUP_ONLY mode
# which downloads and builds the modpack, and then shuts down.
ARG SETUP_ONLY=true
ARG CF_SERVER_MOD=https://mediafilez.forgecdn.net/files/4303/770/Valhelsia-5-5.0.12-SERVER.zip

# Valhelsia 5 settings.
ENV TYPE=CURSEFORGE
ENV CF_BASE_DIR="/data"
ENV FORGE_VERSION=43.2.1
ENV VERSION=1.19.2

# Extra mods
ENV MODS=https://mediafilez.forgecdn.net/files/3934/701/Dynmap-3.4-forge-1.19.2.jar

RUN /start
COPY install-forge.sh /install-forge.sh
RUN /install-forge.sh && rm /install-forge.sh

# Use our custom ServerStart script with optimized jvm settings.
COPY --chown=1000:1000 run.sh /data/run.sh
ENV CF_SERVER_MOD=/data/Valhelsia-5-${VALHELSIA_VERSION}-SERVER.zip

LABEL org.pointclap.mc.modpack=valhelsia5
LABEL org.pointclap.mc.modpack.version=${VALHELSIA_VERSION}
LABEL org.pointclap.mc.minecraft.version=${VERSION}

VOLUME /data/world
VOLUME /data/dynmap
VOLUME /data/simplebackups
