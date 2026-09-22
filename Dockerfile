FROM docker.io/twinproduction/gatus:latest

LABEL org.opencontainers.image.source="https://github.com/INAPP-Mobile/gatus"

# Gatus listens on port 8080 by default
EXPOSE 8080

# Healthcheck hits the API endpoint
HEALTHCHECK --interval=30s --timeout=5s --start-period=30s --retries=3 \
  CMD wget --no-verbose --tries=1 --spider "http://127.0.0.1:8080/api/v1/endpoints/statuses" >/dev/null 2>&1 || exit 1
