# bun-git

A minimal Docker image combining [Bun](https://bun.sh) runtime and [Git](https://git-scm.com) — nothing more, nothing less.

## Why

The official `oven/bun` image does not include Git, which makes it inconvenient for
CI/CD pipelines that need to clone repositories, run install scripts, or interact
with version control during the build process.

This image solves that by copying the Bun binary directly into `alpine/git`,
keeping the final image as small as possible (~50MB).

## Usage

```bash
docker pull vimcaw/bun-git:latest
```

```bash
# Run a Bun script
docker run --rm -v $(pwd):/app vimcaw/bun-git bun run index.ts

# Use in your own Dockerfile
FROM vimcaw/bun-git:latest

WORKDIR /app
COPY . .
RUN bun install
CMD ["bun", "run", "start"]
```

## Tags

| Tag | Bun Version | Base |
|-----|------------|------|
| `latest` | latest stable | alpine/git |
| `bun1-alpine` | latest v1.x | alpine/git |
| `bun{version}-alpine` | locked version | alpine/git |

Tags are generated automatically based on the actual Bun version bundled in the image.

```bash
# Pin to a specific version (recommended for production)
docker pull vimcaw/bun-git:bun1.1.38-alpine

# Track latest v1.x (safe from major version breaking changes)
docker pull vimcaw/bun-git:bun1-alpine

# Always use the latest
docker pull vimcaw/bun-git:latest
```

## Auto Updates

This image is **rebuilt automatically every week** via GitHub Actions to pick up
the latest Bun releases and security patches from the base image.

You can always find the latest build status in the
[Actions tab](https://github.com/vimcaw/bun-git/actions).

## What's Included

| Tool | Version |
|------|---------|
| `bun` | latest stable |
| `bunx` | latest stable (symlinked) |
| `git` | latest alpine stable |

## License

[MIT](./LICENSE) © Changsheng Zhu
