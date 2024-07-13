#/usr/bin/bash

#####################################################################################
# Auteur        : Marc Jaffre
# Version       : 1.0 (Alpha)
# Utilisation   : bash build.sh <Dossier> <DockerFile> <Image_de_sortie>
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
nano ./Docker/Build/$1/$2;

#####################################################################################
# Supprimer l-image #
#####################
echo "Suppression de l'image $3"
docker image rm -f $3 2>/dev/null; 


#####################################################################################
# Construction de l-image #
###########################
docker build -f ./Docker/Build/$1/$2 . -t $3;
