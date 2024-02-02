#!/bin/bash

set -eux

export PGPASSWORD=${POSTGRES_PASSWORD}
while ! psql -h db_primary -U ${POSTGRES_USER} -d ${POSTGRES_DB} -p 5432 -c "select 'it is running';" 2>&1; do \
    sleep 1s; \
done

pg_basebackup \
  -h db_primary \
  -p 5432 \
  -D ${PGDATA} \
  -S test1_replication_slot \
  --progress \
  -X stream \
  -U replicator \
  -Fp \
  -R || :

/usr/local/bin/docker-entrypoint.sh -c 'config_file=/etc/postgresql/postgresql.conf' -c 'hba_file=/etc/postgresql/pg_hba.conf'
