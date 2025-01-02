#! /bin/bash

set -e -o pipefail

if [ -z "${RESTIC_PASSWORD}" ]; then
  echo "RESTIC_PASSWORD is not set"
  exit 1
fi

if [ -z "${RESTIC_REPOSITORY}" ]; then
  echo "RESTIC_REPOSITORY is not set"
  exit 1
fi

PRUNE_INTERVAL=${PRUNE_INTERVAL:-604800}

# Generate a random interval between 0 and PRUNE_INTERVAL
INITIAL_INTERVAL=$(( (RANDOM * 100) % PRUNE_INTERVAL))
echo "$(date) - Sleeping for initial ${INITIAL_INTERVAL} seconds..."
sleep "${INITIAL_INTERVAL}"

while true; do
  echo "$(date) - Pruning repository..."
  restic prune

  echo "$(date) - Pausing for ${PRUNE_INTERVAL} seconds..."
  sleep "${PRUNE_INTERVAL}"
done
