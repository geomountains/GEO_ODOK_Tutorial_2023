#!/bin/bash
set -eux

THISDIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

#Demo PostgreSQL Database initialisation
psql postgres -c "CREATE USER postgres PASSWORD 'Postgres1'"
#The -O flag below sets the user: createdb -O DBUSER DBNAME
createdb -T template_postgis -O postgres tutorial
psql tutorial -c "create extension postgis_raster"

psql -d tutorial -U postgres -f $THISDIR/seed_db.sql
