#!/usr/bin/env bash

base_path=~/docker/data/postgres
container_name=postgres
port=5432
password=postgres

mkdir -p $base_path/{data,conf}
cp ./postgres.conf $base_path/conf/.

docker run -d \
    --name $container_name \
    -v $base_path/conf/postgres.conf:/etc/postgresql/postgresql.conf \
    -e PGDATA=/var/lib/postgresql/data/pgdata \
    -e POSTGRES_PASSWORD=$password \
    -v $base_path/data:/var/lib/postgresql/data \
    -p $port:5432 \
    postgres
