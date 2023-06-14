#!/bin/bash
set -eux

THISDIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

#Demo PostgreSQL Database initialisation
psql postgres -c "CREATE USER postgres PASSWORD 'Postgres1'"
#The -O flag below sets the user: createdb -O DBUSER DBNAME
createdb -O postgres tutorial

psql -d tutorial -U postgres -f $THISDIR/seed_db.sql
