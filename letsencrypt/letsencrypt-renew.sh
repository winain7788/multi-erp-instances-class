#!/usr/bin/env bash

LE_DIR=$(pwd)
REPO_DIR=${LE_DIR}
CERTS=${REPO_DIR}/certs
CERTS_DATA=${REPO_DIR}/certs-data
NGINX_CONTAINER=v_serve_proxy

# certs and certs-data directory expected to already exist and
# contain prior certificate information
if [ ! -d "${CERTS}" ]; then
    echo "WARNING: no certs directory!"
    exit 1;
fi

if [ ! -d "${CERTS_DATA}" ]; then
    echo "WARNING: no certs-data directory!"
    exit 1;
fi

docker run -t --rm \
    -v ${CERTS}:/etc/letsencrypt \
    -v ${CERTS_DATA}:/data/letsencrypt \
    certbot/certbot \
    renew \
    --webroot --webroot-path=/data/letsencrypt

cd ${REPO_DIR}
docker-compose kill -s HUP ${NGINX_CONTAINER}
cd ${LE_DIR}

exit 0;
