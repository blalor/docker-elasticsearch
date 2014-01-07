#!/bin/bash

set -e

IMAGE="localhost:5000/apps/elasticsearch"

docker build -t ${IMAGE} .
docker push ${IMAGE}
