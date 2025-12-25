#! /bin/bash

set -e -o pipefail

if [ -z "${IGD_URL}" ]; then
  echo "IGD_URL is not set"
  exit 1
fi

# UPnP port mappings
# Format: <description>,<internal_ip>,<external_port>,<protocol>
MAPPING_FILE=/mapping.csv

if [ ! -f "${MAPPING_FILE}" ]; then
  echo "${MAPPING_FILE} not found"
  exit 1
fi

REFRESH_INTERVAL=${REFRESH_INTERVAL:-300}

while true; do
    while IFS=, read -r description internal_port external_port protocol; do
        echo
        echo "Adding UPnP port mapping: ${description} -> ${internal_port}:${external_port}/${protocol}"
        upnpc -u "${IGD_URL}" -e "${description}" -r "${internal_port}" "${external_port}" "${protocol}"
    done < ${MAPPING_FILE}

    echo; echo; echo
    echo "========== Current UPnP port mappings =========="
    upnpc -u "${IGD_URL}" -l
    echo "================================================"
    echo "Pausing for ${REFRESH_INTERVAL} seconds..."
    sleep "${REFRESH_INTERVAL}"
done
