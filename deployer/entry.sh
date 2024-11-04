#! /bin/bash

set -e -o pipefail

if [ -z "${GH_TOKEN}" ]; then
  echo "GH_TOKEN is not set"
  exit 1
fi

if [ -z "${COMPOSE_URL}" ]; then
  echo "COMPOSE_URL is not set"
  exit 1
fi

REFRESH_INTERVAL=${REFRESH_INTERVAL:-300}
WAIT_TIMEOUT=${WAIT_TIMEOUT:-300}
INITIAL_WAIT=${INITIAL_WAIT:-120}

echo "Waiting for ${INITIAL_WAIT} seconds before starting..."
while true; do
    echo "Fetching latest docker-compose.yml from ${COMPOSE_URL}"
    curl -sSL -H "Authorization: token ${GH_TOKEN}" -o docker-compose.yml "${COMPOSE_URL}"
    echo "Starting services..."
    docker compose up --wait --wait-timeout "${WAIT_TIMEOUT}" || true
    echo "Pausing for ${REFRESH_INTERVAL} seconds..."
    sleep "${REFRESH_INTERVAL}"
done
