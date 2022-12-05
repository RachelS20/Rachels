## add your implementation here
echo "Restoring database"
psql -U postgres -c "CREATE DATABASE ${DBNAME}"
# PGPASSWORD=${POSTGRES_PASSWORD} psql -h ${AZURE_STORAGE_BACKUP_PATH} -d ${DBNAME} -U ${POSTGRES_USER} -W
psql -h ${AZURE_STORAGE_BACKUP_PATH} -d ${DBNAME} -U ${POSTGRES_USER} -W
psql -U postgres -c "GRANT ALL PRIVILEGES ON DATABASE ${DBNAME} TO postgres"
echo "Database restored successfully"