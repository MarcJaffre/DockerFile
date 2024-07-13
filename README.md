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
bash ./Docker/build.sh Dockerfile/Alpine apache2 web
bash ./Docker/build.sh Dockerfile/Alpine mariadb database
bash ./Docker/build.sh Dockerfile/Alpine glpi ticketing
bash ./Docker/build.sh Dockerfile/Alpine centreon supervision
```
