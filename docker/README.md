# Docker

Local container stacks, managed by [doco-cd](https://github.com/kimdre/doco-cd).

## Setup

### 1. Bootstrap doco-cd (once, manually)

Following env variables can be set in `docker/doco-cd/<host>.env`:

- `TARGET` (required)
- `DOCKER_SOCKET` (optional, defaults to `/var/run/docker.sock`)
- `PROMETHEUS_RETENTION_TIME` (optional, defaults to `15d`)
- `LOKI_RETENTION_TIME` (optional, defaults to `15d`)
- `TEMPO_RETENTION_TIME` (optional, defaults to `24h`)

```sh
docker compose --env-file docker/doco-cd/host.env -f docker/doco-cd/compose.yaml up -d
```

This runs the doco-cd agent, which:

- polls `https://github.com/jazzlyn/dotfiles.git` on the `main` branch every 180s
- uses `target` from the env provided to select `docker/.doco-cd.host.yaml`
- deploys every stack listed in that file

### 2. Everything else is automatic

Editing files under `docker/` and pushing to `main` triggers a redeploy within ~180s. No manual interaction needed.

### Manual fallback

If you want to deploy/update a stack without doco-cd (e.g. while iterating locally before pushing):

```sh
docker compose --env-file docker/doco-cd/host.env -f docker/observability/compose.yaml up -d
```

### Teardown

```sh
docker compose --env-file docker/doco-cd/host.env -f docker/observability/compose.yaml down -v
docker compose --env-file docker/doco-cd/host.env -f docker/doco-cd/compose.yaml down -v
```

## Adding a new stack

1. Create `docker/<name>/compose.yaml`
2. Add an entry to `docker/.doco-cd.<host>.yaml`
