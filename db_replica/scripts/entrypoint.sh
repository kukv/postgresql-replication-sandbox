#!/bin/bash

set -eux

pg_basebackup \
  -h db_primary \
  -p 5432 \
  -D ${PGDATA} \
  -S test_replication_slot \
  -X stream \
  -U replicator \
  -R || true

/usr/local/bin/docker-entrypoint.sh -c 'config_file=/etc/postgresql/postgresql.conf' -c 'hba_file=/etc/postgresql/pg_hba.conf'
