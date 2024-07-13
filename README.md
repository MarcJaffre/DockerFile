# Telecharger le code Source 
```
clear;
cd /root;
rm -r ./Docker 2>/dev/null;
git clone https://github.com/MarcJaffre/Docker.git 2>/dev/null;
```

# Syntaxe de la commande
```
bash ./Docker/build.sh Dockerfile/<OS> <FICHIER> <IMAGE DE SORTIE>
```

```
bash ./Docker/build.sh Dockerfile/Alpine apache apache2
bash ./Docker/build.sh Dockerfile/Alpine mariadb mariadb
bash ./Docker/build.sh Dockerfile/Alpine glpi glpi
bash ./Docker/build.sh Dockerfile/Alpine 3 centreon
bash ./Docker/build.sh Dockerfile/Alpine 4 
```
