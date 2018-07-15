#!/bin/bash

docker-compose -f docker-compose.debug.yml up -d $@
docker attach bank-accounting_api_1
