echo Database Name?:
read DB_NAME

echo User Name?
read USER_NAME

echo User Password?
read USER_PASSWORD


COMMAND="CREATE DATABASE $DB_NAME;CREATE USER $USER_NAME WITH PASSWORD $USER_PASSWORD;GRANT ALL PRIVILEGES ON DATABASE $DB_NAME TO $USER_NAME;ALTER DATABASE $DB_NAME OWNER TO $USER_NAME;"
psql -c "$COMMAND"
echo $COMMAND

echo "Success!"
