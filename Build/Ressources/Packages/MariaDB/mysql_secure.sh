####################################################################################################################################################################################
# Securisation de la base de donnee #
#####################################
#(echo ""; echo "y"; echo "y"; echo "$PASS_ROOT_SQL"; echo "$PASS_ROOT_SQL"; echo "y"; echo "y"; echo "y"; echo "y") | /usr/bin/mysql_secure_installation --skip-grant-tables;


mkdir -p /var/lib/mysql /var/run/mysqld;
chown -R $USERNAME:$GROUP /var/lib/mysql /var/run/mysqld /var/run/mysqld;
