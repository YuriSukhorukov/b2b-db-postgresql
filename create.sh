# PGPASSWORD=12345 
chmod 600 .pgpass
PGPASSFILE=$(pwd)/.pgpass psql b2b postgres -f sql/DropDB.sql -f sql/CreateDB.sql