FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive
ENV STEAMCMDDIR=/steamcmd
ENV SERVERDIR=/server

# Rust server app ID
ENV STEAMAPPID=258550 

RUN apt-get update && apt-get install -y \
    lib32gcc-s1 curl tar gzip lib32stdc++6 ca-certificates unzip && \
    mkdir -p ${STEAMCMDDIR} ${SERVERDIR} && \
    useradd -m steam && \
    chown -R steam:steam ${STEAMCMDDIR} ${SERVERDIR}

USER steam
WORKDIR ${STEAMCMDDIR}

# Install SteamCMD
RUN curl -sSL https://steamcdn-a.akamaihd.net/client/installer/steamcmd_linux.tar.gz | tar -xzv

# Install Rust server
RUN ./steamcmd.sh +login anonymous +force_install_dir ${SERVERDIR} +app_update ${STEAMAPPID} validate +quit

# Install Oxide/uMod.
WORKDIR ${SERVERDIR}
RUN curl -fsSL https://umod.org/games/rust/download/latest/linux -o oxide.zip && \
    unzip oxide.zip -d . && \
    rm oxide.zip

EXPOSE 28015/tcp 28015/udp 28016/tcp 28016/udp

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
