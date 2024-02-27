ARG NODE_IMAGE=oven/bun:1-alpine

FROM --platform=linux/amd64 $NODE_IMAGE AS base
WORKDIR /usr/src/app
# RUN apk --no-cache add openssh g++ make python3 git

COPY . .
FROM base AS install
RUN bun install --frozen-lockfile

FROM install AS prerelease

ENV NODE_ENV=production
RUN bun run build

FROM base AS release
COPY --chown=bun:bun --from=prerelease /usr/src/app/.output .

USER bun
ENV HOST 0.0.0.0
EXPOSE 3000
ENTRYPOINT [ "bun", "run", "server/index.mjs" ]