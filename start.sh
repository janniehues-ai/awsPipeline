#!/bin/bash

echo "Starting Pipeline: ${DOMAIN}"

docker compose pull

cp env.example .env
touch dex.env

docker compose up -d
docker compose exec redis redis-cli sadd groups:presenter admin@example.com

