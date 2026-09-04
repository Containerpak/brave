FROM ghcr.io/containerpak/gtk3:main

LABEL org.opencontainers.image.source="https://github.com/Containerpak/brave"

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
      libnspr4 \
      libnss3 && \
    ln -s /opt/brave.com/brave/brave-browser /usr/bin/brave-browser && \
    cpak-clean-junk
