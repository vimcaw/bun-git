FROM oven/bun:alpine

LABEL maintainer="Vimcaw"
LABEL description="Bun + Git Docker image for some use cases"
LABEL org.opencontainers.image.source="https://github.com/vimcaw/bun-git"

RUN apk add --no-cache git
