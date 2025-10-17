#!/bin/bash

echo "Starting Pipeline: ${DOMAIN}"

docker compose pull

cp env.example .env
touch dex.env

docker compose up -d

sleep 10
docker compose exec redis redis-cli sadd groups:presenter admin@example.com

#docker compose exec streamingasr bash -c "curl -H 'Content-Type: application/json' http://ltapi:5000/ltapi/register_worker -d '{\"component\": \"asr\", \"name\": \"mult57\", \"server\": \"http://asr.${DOMAIN}/asr\"}'"
#docker compose exec streamingasr bash -c "curl -H 'Content-Type: application/json' http://ltapi:5000/ltapi/register_worker -d '{\"component\": \"mt\", \"name\": \"mult16\", \"server\": \"http://mt.${DOMAIN}\"}'"
#docker compose exec streamingasr bash -c "curl -H 'Content-Type: application/json' http://ltapi:5000/ltapi/register_worker -d '{\"component\": \"tts\", \"name\": \"mult\", \"server\": \"http://tts.${DOMAIN}/tts\"}'"

