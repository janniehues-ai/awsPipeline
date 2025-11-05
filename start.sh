#!/bin/bash

echo "Starting Pipeline: ${DOMAIN}"

docker compose pull

cp env.example .env
touch dex.env
echo $BASICAUTHHASH >> traefik/auth/basicauth.txt

docker compose up -d

sleep 10
docker compose exec redis redis-cli sadd groups:presenter admin@example.com

