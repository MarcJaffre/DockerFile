# Telecharger GLPI
wget https://github.com/glpi-project/glpi/releases/download/$VERSION/glpi-$VERSION.tgz -O /tmp/glpi.tgz

# Extraire le fichier compresser
tar -xf /tmp/glpi.tgz -C /var/www/html;

# Permissions (Apache)
chown -R $USERNAME:$GROUP /var/www/html;
chmod 755 /var/www/html/glpi;



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
