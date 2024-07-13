#/usr/bin/bash
#####################################################################################
# Auteur        : Marc Jaffre
# Version       : 1.0 (Alpha)
# Utilisation   : bash build.sh <Dockerfile> <image_de_sortie>
# Presentation  :
# - Editer le fichier Dockerfile
# - Supprimer l-image
# - Construction de l-image
#####################################################################################

#####################################################################################
# Nettoyage de la console #
###########################
clear;

#####################################################################################
# Editer le DockerFile #
########################
nano ./Dockerfile/$1;

#####################################################################################
# Supprimer l-image #
####################
docker image rm -f $2 2>/dev/null;

#####################################################################################
# Construction de l-image #
###########################
docker build -f ./Dockerfile/$1 . -t $2;
#####################################################################################
