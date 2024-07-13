# Telecharger GLPI
wget https://github.com/glpi-project/glpi/releases/download/$VERSION/glpi-$VERSION.tgz -O /tmp/glpi.tgz 2>/dev/null;

# Extraire le fichier compresser
tar -xf /tmp/glpi.tgz -C /var/www/html;

# Permissions (Apache)
chown -R $USERNAME:$GROUP /var/www/html;
chmod 755 /var/www/html/glpi;
