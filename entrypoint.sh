#!/bin/sh
python manage.py migrate

python seeder.py
exec "$@"
