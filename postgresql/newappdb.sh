createdb $1
createuser $2
psql -c "alter user $2 with encrypted password '$2';"
psql -c "grant all privileges on database $1 to $2;"
psql -c "alter database $2 owner to $1;"

