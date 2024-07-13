#!/usr/bin/bash

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
# Verification #
################
# if [ $(curl http://localhost) = XXX ]; then
# rm /var/www/html/glpi/install.install.php:
# fi

#######################################################################################################################################
# Demarrage du conteneur #
##########################
/usr/sbin/apache2ctl -D FOREGROUND;
