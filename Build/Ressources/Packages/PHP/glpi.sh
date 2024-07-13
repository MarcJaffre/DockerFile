##############################################################################################################################
# Modules PHP pour GLPI #
#########################
apt install -y php-curl                   2>/dev/null;
apt install -y php-gd                     2>/dev/null;
apt install -y php-intl                   2>/dev/null;
apt install -y php-mysqli                 2>/dev/null;
apt install -y php-simplexml              2>/dev/null;
apt install -y php-bz2                    2>/dev/null;
apt install -y php-ldap                   2>/dev/null;
apt install -y php-mbstring               2>/dev/null;
apt install -y php-symfony-polyfill-ctype 2>/dev/null;
apt install -y php-zip                    2>/dev/null;


##############################################################################################################################
# Activation du module Rewrite #
################################
a2enmod rewrite;
