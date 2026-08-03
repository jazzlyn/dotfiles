# Observability stack

- **otel-collector** (`otel/opentelemetry-collector-contrib`) — receives OTLP on `4317` (gRPC) / `4318` (HTTP), exposes an
  internal Prometheus exporter on `9464`. Traces/logs are only sent to a debug (stdout) exporter for now — this stack is
  scoped to metrics.
- **prometheus** — scrapes the collector's `9464` endpoint, UI on `9090`.
- **grafana** — Prometheus datasource pre-provisioned, UI on `3000`.

Send metrics to the endpoint `http://localhost:4317`, protocol `grpc`.
