# Telecharger le code Source 
```
clear;
cd /root;
rm -r ./Docker 2>/dev/null;
git clone https://github.com/MarcJaffre/Docker.git 2>/dev/null;
```

# Construction
```
bash ./Docker/build.sh Dockerfile/Alpine 0 apache2
bash ./Docker/build.sh Dockerfile/Alpine 1 mariadb
bash ./Docker/build.sh Dockerfile/Alpine 2 glpi
bash ./Docker/build.sh Dockerfile/Alpine 3 centreon
bash ./Docker/build.sh Dockerfile/Alpine 4 
```
