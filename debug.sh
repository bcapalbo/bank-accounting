#!/bin/bash

docker-compose -f docker-compose.debug.yml up -d db
sleep 20
docker-compose -f docker-compose.debug.yml up -d api $@
docker attach bank-accounting_api_1

