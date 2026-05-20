FROM oven/bun:alpine AS bun
FROM alpine/git

LABEL maintainer="Vimcaw"
LABEL description="Bun + Git Docker image for some use cases"
LABEL org.opencontainers.image.source="https://github.com/vimcaw/bun-git"

COPY --from=bun /usr/local/bin/bun /usr/local/bin/bun

# Also include bunx
RUN ln -s /usr/local/bin/bun /usr/local/bin/bunx

WORKDIR /app

RUN bun --version && git --version
