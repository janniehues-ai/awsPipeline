#!/bin/bash

echo "Starting Pipeline: ${DOMAIN} (MT replicas: ${MT_REPLICAS:-16}, TTS replicas: ${TTS_REPLICAS:-16}, ASR replicas: ${ASR_REPLICAS:-6})"

docker compose pull

cp env.example .env
echo ADMIN_PASSHASH=\'`echo $BASICAUTHHASH | sed -r 's/^[^:]+://'`\' >> dex.env
echo $BASICAUTHHASH >> traefik/auth/basicauth.txt

docker compose up -d

sleep 10
docker compose exec redis redis-cli sadd groups:presenter admin@example.com

if [ -n "$REGISTRYPASS" ]; then
  echo $REGISTRYPASS | docker login registry.isl.iar.kit.edu -u scc-deployment --password-stdin
  docker compose -f docker-compose.VAIS.yaml up -d
fi

