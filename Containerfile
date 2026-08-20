FROM ghcr.io/containerpak/gtk3:main

LABEL org.opencontainers.image.source="https://github.com/Containerpak/brave"

RUN ln -s /opt/brave.com/brave/brave-browser /usr/bin/brave-browser && \
    cpak-clean-junk
