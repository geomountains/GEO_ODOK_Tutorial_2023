#!/bin/bash
set -eux

THISDIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

#Demo PostgreSQL Database initialisation
psql postgres -c "CREATE USER postgres PASSWORD 'Postgres1'"
#The -O flag below sets the user: createdb -O DBUSER DBNAME

sudo su postgres
createdb template_postgis

psql -d template_postgis -c "CREATE EXTENSION postgis;"
psql -d template_postgis -c "CREATE EXTENSION postgis_topology;"
psql -d template_postgis -c "CREATE EXTENSION postgis_raster;"

createdb -T template_postgis -O postgres tutorial

psql -d tutorial -U postgres -f $THISDIR/seed_db.sql
