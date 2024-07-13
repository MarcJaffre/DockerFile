#!/usr/bin/bash

# Démarrage de l'applicatif Apache2 en arrière plan
/usr/sbin/apache2ctl -D FOREGROUND

# Afficher la log
tail -f /var/log/apache2/error.log
