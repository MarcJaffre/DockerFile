##############################################################################################################################
# Modules PHP pour GLPI #
#########################
apt install -y php-curl;
apt install -y php-gd;
apt install -y php-intl;
apt install -y php-mysqli;
apt install -y php-simplexml 
apt install -y php-bz2;
apt install -y php-ldap;
apt install -y php-mbstring;
apt install -y php-symfony-polyfill-ctype;
apt install -y php-zip;


##############################################################################################################################
# Activation du module Rewrite #
################################
a2enmod rewrite
