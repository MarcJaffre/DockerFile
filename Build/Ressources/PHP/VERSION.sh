#!/usr/bin/bash

# Recuperer la version de PHP dans le fichier /PHP_VERSION
echo $(php --version | head -n 1 | cut -c 5-7) > /PHP_VERSION
