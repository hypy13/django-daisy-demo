#!/bin/sh

python manage.py migrate

python loaddata dumpeddata.json
exec "$@"
