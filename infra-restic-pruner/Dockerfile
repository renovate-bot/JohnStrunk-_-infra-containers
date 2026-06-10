FROM alpine:3.24.0@sha256:a2d49ea686c2adfe3c992e47dc3b5e7fa6e6b5055609400dc2acaeb241c829f4

# hadolint ignore=DL3018
RUN apk add --no-cache \
    bash \
    restic

COPY entry.sh /entry.sh
RUN chmod a+rx /entry.sh

ENTRYPOINT [ "/bin/bash" ]
CMD [ "/entry.sh" ]
