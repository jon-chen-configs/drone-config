#!/bin/sh

# Stop on error
set -e

# Deploy server
WD=$(dirname $0)
docker-compose --file ${WD}/drone-compose.yml --env-file ${WD}/../.env up -d

# Deploy runners
SCRIPTS_DIR=${WD}/../../../swarm/scripts
export ENV_DIR=${WD}/../swarm-env-config
export ENV_FILE=${ENV_DIR}/swarm.env
export COMPOSE_FILE=${WD}/drone-swarm.yml
export STACK_NAME=drone-swarm 

${SCRIPTS_DIR}/stack.deploy.sh