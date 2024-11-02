#!/bin/sh
python manage.py migrate

python manage.py seeder.py
exec "$@"
