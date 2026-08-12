FROM ubuntu:26.04 AS source

ARG BRAVE_VERSION=1.93.136
ARG BRAVE_SHA256=9739e5aaee4303eb4199c038b04a75d7bc7ac08314af9f763011e211dea62999

RUN apt-get update && \
    apt-get install -y --no-install-recommends ca-certificates curl dpkg && \
    curl --fail --location --output /tmp/brave.deb \
      "https://brave-browser-apt-release.s3.brave.com/pool/main/b/brave-browser/brave-browser_${BRAVE_VERSION}_amd64.deb" && \
    echo "${BRAVE_SHA256}  /tmp/brave.deb" | sha256sum --check && \
    dpkg-deb --extract /tmp/brave.deb /out

FROM ghcr.io/containerpak/mesa:main

LABEL org.opencontainers.image.source="https://github.com/Containerpak/brave"

COPY --from=source /out/ /

RUN ln -s /opt/brave.com/brave/brave-browser /usr/bin/brave-browser && \
    rm -f /opt/brave.com/brave/chrome-sandbox && \
    cpak-clean-junk
