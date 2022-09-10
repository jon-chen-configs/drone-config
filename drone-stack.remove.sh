#!/bin/sh

WD=$(dirname $0)
docker-compose --file ${WD}/drone-compose.yml --env-file ${WD}/../.env down
