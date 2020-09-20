#! /usr/bin/env bash

eval $(aws ecr get-login --no-include-email --region ap-southeast-1)
docker-compose up
docker-compose down -v
