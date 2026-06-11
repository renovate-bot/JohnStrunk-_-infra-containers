# syntax=docker/dockerfile:1@sha256:87999aa3d42bdc6bea60565083ee17e86d1f3339802f543c0d03998580f9cb89
FROM debian:stable-slim@sha256:418a34cdf4c50c175c04d97697db19268f584ec29b38a7939d70dfe8e0a3d627

# hadolint ignore=DL3008
RUN apt-get update && apt-get install --no-install-recommends -y \
    calibre \
    fonts-dejavu-core \
    fonts-dejavu-extra \
    ca-certificates \
    && rm -rf /var/lib/apt/lists/*

COPY entry.sh /entry.sh
RUN chmod a+rx /entry.sh

ENTRYPOINT [ "/entry.sh" ]
