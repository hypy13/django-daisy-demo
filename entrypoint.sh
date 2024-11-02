#!/bin/sh
# Define the database file path
DB_FILE="db.sqlite3"

# Check if the database file exists
if [ -f "$DB_FILE" ]; then
    echo "Database file $DB_FILE exists. Clearing its content..."
    # Empty the database file
    cat /dev/null > "$DB_FILE"
else
    echo "Database file $DB_FILE does not exist. Creating an empty database..."
    # Create an empty SQLite database file
    sqlite3 "$DB_FILE" "VACUUM;"
fi

echo "Database $DB_FILE is now empty and ready for use."

python manage.py migrate

python manage.py loaddata dumpeddata.json
exec "$@"
