#!/bin/bash

echo "Starting Pipeline: ${DOMAIN}"

docker compose pull

cp env.example .env
echo ADMIN_PASSHASH="`echo $BASICAUTHHASH | sed -r 's/^[^:]+://'`" >> dex.env
echo $BASICAUTHHASH >> traefik/auth/basicauth.txt

docker compose up -d

sleep 10
docker compose exec redis redis-cli sadd groups:presenter admin@example.com

