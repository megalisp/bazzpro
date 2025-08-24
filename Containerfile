FROM ghcr.io/ublue-os/bazzite-nvidia-open:stable

# Backwards-compatible top-level Containerfile — uses the desk variant by default.
ARG VARIANT=desk
ARG RUN_DX=false

COPY build_files /

RUN --mount=type=bind,from=0,source=/,target=/ctx \
        --mount=type=cache,dst=/var/cache \
        --mount=type=cache,dst=/var/log \
        --mount=type=tmpfs,dst=/tmp \
        /bin/sh -c '\
            set -eux; \
            if [ -f /ctx/build_files/${VARIANT}/build.sh ]; then \
                cp /ctx/build_files/${VARIANT}/build.sh /ctx/build.sh; chmod +x /ctx/build.sh; \
            elif [ -f /ctx/build_files/build.sh ]; then \
                cp /ctx/build_files/build.sh /ctx/build.sh; chmod +x /ctx/build.sh; \
            else \
                echo "No build.sh found for variant '${VARIANT}'"; exit 1; \
            fi; \
            if [ -f /ctx/build_files/shared.sh ]; then cp /ctx/build_files/shared.sh /tmp/shared.sh; chmod +x /tmp/shared.sh; fi; \
            /ctx/build.sh; \
            if [ "${RUN_DX}" = "true" ] && [ -f /ctx/build_files/${VARIANT}/dx.sh ]; then /ctx/build_files/${VARIANT}/dx.sh; fi; \
            if [ -f /ctx/dev.sh ]; then /ctx/dev.sh; fi; \
            ostree container commit'

RUN bootc container lint
