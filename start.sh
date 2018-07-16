#!/bin/bash

docker-compose up -d db
sleep 15
docker-compose up -d api
docker attach bank-accounting_api_1
