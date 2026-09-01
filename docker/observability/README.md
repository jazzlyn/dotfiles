# Observability stack

Single-container [Grafana LGTM](https://github.com/grafana/docker-otel-lgtm) image.

- **otel-collector** — receives OTLP on `4317` (gRPC) / `4318` (HTTP), forwards metrics/traces/logs.
- **prometheus** — native OTLP ingestion, UI on `9090`
- **loki** — log storage
- **tempo** — trace storage, UI/API on `3200`
- **grafana** — Prometheus/Loki/Tempo datasources auto-provisioned by the image, UI on `3000`, anonymous admin access (image default).

Send telemetry to `http://localhost:4317` (gRPC) or `http://localhost:4318` (HTTP).
