#######################################################################################################################################
# Fuseau Horaire #
##################
PHP_VERSION=$(php -version | head -n 1 | cut -d "P" -f3 | cut -c 2-4)

# Substitution de ;date.timezone = en date.timezone= Europe/Paris
sed -i -e "s/;date.timezone \=/date.timezone \= Europe\/Paris/g" /etc/php/$PHP_VERSION/apache2/php.ini;

# Prévenir l'accès aux cookies depuis les scripts côté client.
sed -i -e "s/session.cookie_httponly \=/session.cookie_httponly \= on/" /etc/php/$PHP_VERSION/apache2/php.ini;


#######################################################################################################################################
# Apache2 pour GLPI #
#####################
cat > /etc/apache2/sites-available/000-default.conf << EOF
<VirtualHost *:80>
 # Nom du serveur (/etc/hosts)
 ServerName localhost

 # Dossier Web Public
 DocumentRoot /var/www/html/glpi/public
        
 # Fichier à charger par défaut (ordre)
 <IfModule dir_module>
   DirectoryIndex index.php index.html
 </IfModule>

 # Alias
 Alias "/glpi" "/var/www/html/glpi/public"

 # Log
 ErrorLog ${APACHE_LOG_DIR}/error.log
 CustomLog ${APACHE_LOG_DIR}/access.log combined

 # Repertoire
 <Directory /var/www/html/glpi/public>
   Require all granted
   RewriteEngine On
   RewriteCond %{REQUEST_FILENAME} !-f
   RewriteRule ^(.*)$ index.php [QSA,L]
 </Directory>
</VirtualHost>
EOF

#######################################################################################################################################
# Deploiement de GLPI #
#######################
# Telecharger GLPI
wget https://github.com/glpi-project/glpi/releases/download/$VERSION/glpi-$VERSION.tgz -O /tmp/glpi.tgz 2>/dev/null;

# Extraire le fichier compresser
tar -xf /tmp/glpi.tgz -C /var/www/html;

# Permissions (Apache)
chown -R $USERNAME:$GROUP /var/www/html;
chmod 755 /var/www/html/glpi;

#######################################################################################################################################
# Installation du site #
########################
/var/www/html/glpi/bin/console db:install --reconfigure \
--default-language=$LANGUE --db-host=$HOST --db-port=3306 --db-name=$DATABSE --db-user=$USERNAMEDB --db-password=$PASSDB --force;
