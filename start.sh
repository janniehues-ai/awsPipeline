#!/bin/bash

echo "Starting Pipeline: ${DOMAIN}"

docker compose pull

cp env.example .env
touch dex.env
echo $pipelineBasicauth >> traefik/auth/basicauth.txt

docker compose up -d

