#!/bin/bash

echo "Waiting for MySQL to be ready..."
until mysql -h 127.0.0.1 -u user -ppassword -e "SELECT 1" &> /dev/null
do
    sleep 1
done

echo "Importing CSV data into MyDriversDB.drivers..."
mysql --local-infile=1 -h 127.0.0.1 -u user -ppassword MyDriversDB <<EOF
LOAD DATA LOCAL INFILE '/workspaces/MySQL-Demo/mydrivers.csv'
INTO TABLE drivers
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(channel, version, revision, binary_type, platform, url, http_status);
EOF

echo "Import complete!"
