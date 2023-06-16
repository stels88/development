#!/bin/bash

# MySQL credentials
MYSQL_USER="username"
MYSQL_PASSWORD="password"
MYSQL_DATABASE="database"

# Backup folder and file name
BACKUP_DIR="/path/to/backup/folder"
DATE=$(date +%Y-%m-%d_%H-%M-%S)
BACKUP_FILE="$BACKUP_DIR/$MYSQL_DATABASE-$DATE.sql"

# Create the backup folder if it doesn't exist
mkdir -p $BACKUP_DIR

# Dump the database to a file
mysqldump --single-transaction -u $MYSQL_USER -p$MYSQL_PASSWORD $MYSQL_DATABASE > $BACKUP_FILE

# Compress the backup file
tar -czvf $BACKUP_FILE.tar.gz $BACKUP_FILE

# Remove the uncompressed file
rm $BACKUP_FILE
```

This script:

1. Defines the MySQL credentials and database name to be backed up.
2. Specifies a backup directory and creates it if it doesn't exist.
3. Uses `mysqldump` to create a backup file in SQL format.
4. Compresses the backup file using `tar`.
5. Deletes the uncompressed SQL file.

You can schedule this script to run automatically using cron, for example, to create daily backups of your MySQL database.
