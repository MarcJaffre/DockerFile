####################################################################################################################################################################################
# Securisation de la base de donnee #
#####################################
#--skip-grant-tables
(echo ""; echo "y"; echo "y"; echo "$PASS_ROOT_SQL"; echo "$PASS_ROOT_SQL"; echo "y"; echo "y"; echo "y"; echo "y") | /usr/bin/mysql_secure_installation;

