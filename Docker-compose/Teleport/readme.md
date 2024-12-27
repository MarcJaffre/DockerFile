------------------------------------------------------------------------------------------
# <p align='center'> [Guide de création du conteneur Teleport](https://github.com/auyongjinyoo/teleport-setup) </p>

------------------------------------------------------------------------------------------
### I. Portainer (Méthode 1)
#### A. Création du volume
```bash
clear;
docker volume rm -f teleport_config  teleport_data 2>/dev/null;
docker volume create teleport_config;
```

#### B. Teleport.yaml
Création du fichier `teleport.yaml` sur la machine et modifier `192.168.0.80` par l'ip de la machine.
```bash
clear
VOLUME=$(docker volume inspect teleport_config  | grep Mount | cut -d ":" -f 2 | cut -d '"' -f 2 )
nano $VOLUME/teleport.yaml;
```

#### C. Création du stack
Création du Stack `teleport` avec les variables.

###### Docker-compose
```yml
################
version: '3.8' #
services:      #
################
#
#######################################################
 teleport:                                            #
  # ------------------------------------------------- #
  image: "$TELEPORT_IMAGE"                            #
  container_name: 'teleport'                          #
  network_mode: 'bridge'                              #
  hostname: 'teleport'                                #
  # ------------------------------------------------- #
  entrypoint: '/bin/sh'                               #
  command: -c "$COMMAND_START2"                       #
  # ------------------------------------------------- #
  ports:                                              #
   - '3023:3023'                                      #
   - '3024:3024'                                      #
   - '3025:3025'                                      #
   - '3080:3080'                                      #
  # ------------------------------------------------- #
  volumes:                                            #
   - 'config:/etc/teleport'                           #
   - 'data:/var/lib/teleport'                         #
#######################################################
#
#
#######################################################
volumes:                                              #
 # -------------------------------------------------- #
 config:                                              #
  external: false                                     #
 # -------------------------------------------------- #
 data:                                                #
  external: false                                     #
#######################################################
```

###### TELEPORT_IMAGE
```bash
public.ecr.aws/gravitational/teleport:14
```

###### COMMAND_START2
Ajouter `--insecure`.
```
sleep 1 && /bin/dumb-init teleport start -c /etc/teleport/teleport.yaml
```

#### D. Ajouter un utilisateur Teleport via la commande suivante.
```bash
clear;
docker exec teleport tctl users add marc --roles=editor,access --logins=root
```

<br />
<br />

------------------------------------------------------------------------------------------
### II. Portainer (Méthode 2)
#### A. Creation du Stack
Création du Stack en modifiant le hostname et ajouter les variables suivantes.

###### TELEPORT_IMAGE
```bash
public.ecr.aws/gravitational/teleport:14
```

###### COMMAND_START1
```
if [ ! -f /etc/teleport/teleport.yaml ]; then teleport configure > /etc/teleport/teleport.yaml; fi
```

###### COMMAND_START2
```
sleep 1 && /bin/dumb-init teleport start -c /etc/teleport/teleport.yaml
```

<br />

#### B. Edition du Stack
Supprimer le service `Configuration`.
```yml
#######################################################
# Permet de generer le fichier de configuration       #
#######################################################
 configure:                                           #
  # ------------------------------------------------- #
  image: "$TELEPORT_IMAGE"                            #
  container_name: 'teleport-configure'                #
  network_mode: 'bridge'                              #
  hostname: '192.168.0.80'                            #
  # ------------------------------------------------- #
  entrypoint: '/bin/sh'                               #
  command: -c "$COMMAND_START1"                       #
  # ------------------------------------------------- #
  volumes:                                            #
   - 'teleport_config:/etc/teleport'                  #
#######################################################
```

#### C. Ajouter un utilisateur Teleport via la commande suivante.
```bash
clear;
docker exec teleport tctl users add marc --roles=editor,access --logins=root
```

<br />
<br />

------------------------------------------------------------------------------------------
### III. Ajout d'une machine
#### Enroll New Resource
Aller dans Enroll New Resource > Debian. Ajouter le paramètre -k à curl. (fsSL > fksSL)

###### Exemple 
```
bash -c "$(curl -fksSL https://192.168.0.80:3080/scripts/6b72faeb321fcfc159c9de976065f92b/install-node.sh)"
```
##### Mode insecure (SystemD)
```bash
clear;
sed -i -e "s/\/run\/teleport.pid/\/run\/teleport.pid \-\-insecure/g" /lib/systemd/system/teleport.service
systemctl daemon-reload;
systemctl restart teleport.service;
systemctl status teleport.service;

#ExecStart=/usr/local/bin/teleport start --config /etc/teleport.yaml --pid-file=/run/teleport.pid
#ExecStart=/usr/local/bin/teleport start --pid-file=/run/teleport.pid --insecure
```

```
teleport start     -c /etc/teleport.yaml --insecure
teleport app start -c /etc/teleport.yaml --insecure
teleport db start  -c /etc/teleport.yaml --insecure
```



<br />
<br />

------------------------------------------------------------------------------------------
### IV. Supprimer un Node
Patienter 10 minutes pour la suppression du node
```
pkill -f teleport;
rm -rf /var/lib/teleport;
rm -f /etc/teleport.yaml;
rm -f /usr/local/bin/teleport;
rm -f /usr/local/bin/tctl;
rm -f /usr/local/bin/tsh;
apt remove --purge -y teleport;
```


docker exec teleport tctl nodes ls --format yaml
