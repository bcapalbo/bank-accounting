#!/bin/bash

docker-compose -f docker-compose.develop.yml up -d db
sleep 20
docker-compose -f docker-compose.develop.yml up -d $@ api
