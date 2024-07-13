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
nano ./Docker/Build/$1/$2;


clear;
echo "#######################################################################################################"
docker image rm -f $3 2>/dev/null; 
echo "#######################################################################################################"
docker build -f ./Docker/Build/$1/$2 . -t $3;
echo "#######################################################################################################"
