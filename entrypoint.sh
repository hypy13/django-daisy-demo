#!/bin/sh

python manage.py migrate

python manage.py loaddata dumpeddata.json
exec "$@"
