#!/usr/bin/env bash

until cqlsh db 9042 -e "describe keyspaces;"; do
  >&2 echo "Cassandra is unavailable - sleeping"
  sleep 1
done

>&2 echo "Cassandra is up - executing command[$@]"

exec $@

