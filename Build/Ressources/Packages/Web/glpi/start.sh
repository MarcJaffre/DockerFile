#######################################################################################################################################
# Installation du site #
########################
echo "yes no" | /var/www/html/glpi/bin/console db:install \
--reconfigure \
--default-language=$LANGUE \
--db-host=$HOST \
--db-port=3306 \
--db-name=$DATABSE \
--db-user=$USERNAMEDB \
--db-password=$PASSDB \
--force;


#######################################################################################################################################
# Demarrage du conteneur #
##########################
/usr/sbin/apache2ctl -D FOREGROUND;
