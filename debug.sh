#!/bin/bash

docker-compose up -d $@
docker attach bank-accounting_api_1
