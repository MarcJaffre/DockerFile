### Telecharger le code Source 
```
clear;
cd /root;
rm -r ./Docker 2>/dev/null;
git clone https://github.com/MarcJaffre/Docker.git 2>/dev/null;
```

### Syntaxe de la commande
```
bash ./Docker/build.sh Dockerfile/<OS> <FICHIER> <IMAGE DE SORTIE>
```

### Construction
```
clear;
docker system prune -f;
bash ./Docker/build.sh Dockerfile/Debian apache2 web
bash ./Docker/build.sh Dockerfile/Debian mariadb database
bash ./Docker/build.sh Dockerfile/Debian glpi ticketing
bash ./Docker/build.sh Dockerfile/Debian centreon supervision
```

### Complément
```
docker exec -it Apache2 ash
```
