#!/bin/bash

LISTEN_ADDRESSES="listen_addresses = 'localhost'"
DB_NAME=test_db
DB_USER=georgia
DB_PASSWORD=georgia

echo "....INSTALLING PREREQUISITE SOFTWARE PACKAGES...."
sudo apt install wget ca-certificates


echo "....OBTAINING AND ADDING SOFTWARE CERTIFICATES TO APT-KEY MANAGEMENT UTILITY...."
wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | sudo apt-key add -


echo "....CREATING NEW CONFIGURATION FILE WITH OFFICIAL POSTGRESQL REPOSITORY ADDRESS...."
sudo sh -c 'echo "deb http://apt.postgresql.org/pub/repos/apt/ $(lsb_release -cs)-pgdg main" >> /etc/apt/sources.list.d/pgdg.list'


echo "....UPDATING SYSTEM SOFTWARE REPOSITORY...."
sudo apt update


echo "....INSTALLING POSTGRESQL AND ITS EXTENSIONS...."
sudo apt install -y postgresql postgresql-contrib
postgres -V

echo "....COMMENCING INTERACTIVE SESSION WITH LOCAL DATABASE...."
sudo -su postgres <<EOF

echo "....CREATING NEW DATABASE $DB_NAME...."
createdb $DB_NAME;

echo "....CREATING DATABASE USER $DB_USER WITH PASSWORD"
psql -c "CREATE USER $DB_USER WITH PASSWORD '$DB_PASSWORD';"


echo "....GRANTING $DB_NAME PRIVILEGES TO $DB_USER"
psql -c "grant all privileges on database $DB_NAME to $DB_USER;"
EOF

echo "....DATABASE AND DATABASE USER CREATED SUCCESSFULLY...."


echo "....ACCESSING AND EDITING POSTGRESQL CONGIFURATION FILE TO LISTEN TO ALL AVAILABLE IP...."
sudo sed -i "/^#$LISTEN_ADDRESSES/ c$LISTEN_ADDRESSES" /etc/postgresql/15/main/postgresql.conf

sudo sed "s/localhost/*/g" /etc/postgresql/15/main/postgresql.conf


echo "....ACCESSING AND EDITING POSTGRESQL ACCESS POLICY CONGIFURATION FILE...."
sudo echo "host all all 0.0.0.0/0 md5" >> /etc/postgresql/15/main/pg_hba.conf


echo "....RESTARTING POSTGRESQL SERVICE...."
sudo service postgresql restart
ss -nlt | grep 5432