# Docker

Local container stacks, managed by [doco-cd](https://github.com/kimdre/doco-cd).

## Bootstrap doco-cd (once, manually)

Following env variables can be set in `docker/doco-cd/<host>.env`:

- `TARGET` (required)
- `DOCKER_SOCKET` (optional, defaults to `/var/run/docker.sock`)

```sh
docker compose --env-file docker/doco-cd/host.env -f docker/doco-cd/compose.yaml up -d
```

This runs the doco-cd agent, which:

- polls the configured repos
- uses `target` from the env provided to select `docker/.doco-cd.host.yaml`
- deploys every stack listed in that file

### Everything else is automatic

Editing files under `docker/` and pushing to `main` triggers a redeploy within ~180s. No manual interaction needed.

## Teardown

```sh
docker compose --env-file docker/doco-cd/host.env -f docker/doco-cd/compose.yaml down -v
```

## Adding a new stack

1. Create `docker/<name>/compose.yaml`
2. Add an entry to `docker/.doco-cd.<host>.yaml`
