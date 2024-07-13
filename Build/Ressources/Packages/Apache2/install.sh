###################################################################################################################
# Installation du paquet Apache2 #
##################################
apt install -y apache2       1>/dev/null;
apt install -y apache2-utils 1>/dev/null;

###################################################################################################################
# Fix Erreur #
##############
echo "ServerName localhost" >> /etc/apache2/apache2.conf;

###################################################################################################################
# User Apache2 #
################
mkdir -p /var/lock/apache2 /var/log/apache2 /var/run/apache2;
chown -R $USERNAME:$GROUP /var/lock/apache2 /var/log/apache2 /var/run/apache2 /var/www/html;
