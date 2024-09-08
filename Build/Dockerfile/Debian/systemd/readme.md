# Astuce
Lorsqu'on lance sous Portainer on voit pas les erreurs, lancer le conteneur via Docker run
```
docker run -it --privileged --hostname docker --name dev developpement
```


```
runit
dumb-init
systemd     == CMD ["systemd", "--system", "--log-level=info"]
```
