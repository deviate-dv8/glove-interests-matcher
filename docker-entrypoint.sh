#!/usr/bin/env sh
# Override via env: PORT, UVICORN_WORKERS, UVICORN_LIMIT_CONCURRENCY (optional), UVICORN_TIMEOUT_KEEP_ALIVE.
set -e
set -- uvicorn app.main:app \
  --host 0.0.0.0 \
  --port "${PORT:-8000}" \
  --workers "${UVICORN_WORKERS:-1}"
[ -n "${UVICORN_LIMIT_CONCURRENCY}" ] && set -- "$@" --limit-concurrency "${UVICORN_LIMIT_CONCURRENCY}"
set -- "$@" --timeout-keep-alive "${UVICORN_TIMEOUT_KEEP_ALIVE:-30}"
exec "$@"
