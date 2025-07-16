FROM alpine:3.22.1@sha256:4bcff63911fcb4448bd4fdacec207030997caf25e9bea4045fa6c8c44de311d1

# hadolint ignore=DL3018
RUN apk add --no-cache \
    bash \
    restic

COPY entry.sh /entry.sh
RUN chmod a+rx /entry.sh

ENTRYPOINT [ "/bin/bash" ]
CMD [ "/entry.sh" ]
