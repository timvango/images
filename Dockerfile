# ----------------------------------
# Wine Dockerfile for Steam Servers
# Environment: Ubuntu:18.04 + Wine
# Minimum Panel Version: 0.7.6
# ----------------------------------
FROM        ubuntu:18.04

MAINTAINER  Kenny B, <kenny@venatus.digital>

# Install Dependencies
RUN         dpkg --add-architecture i386 && \
            apt update && \
            apt upgrade -y && \
            apt install -y software-properties-common && \
            apt update && \
            apt install -y --install-recommends wine64 lib32gcc1 libntlm0 wget && \
            useradd -d /home/container -m container && \
            cd /home/container

USER        container
ENV         HOME /home/container
ENV         WINEARCH win64
ENV         WINEPREFIX /home/container/.wine64
WORKDIR     /home/container

COPY        ./entrypoint.sh /entrypoint.sh
CMD         ["/bin/bash", "/entrypoint.sh"]
