# Telecharger le code Source 
```
clear;
cd /root;
rm -r ./Docker 2>/dev/null;
git clone https://github.com/MarcJaffre/Docker.git 2>/dev/null;
```

# Construction
```
bash .\Docker\build.sh Dockerfile/Alpine 0 base:0.1
```
