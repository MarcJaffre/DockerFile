------------------------------------------------------------------------------------------
# <p align='center'> [Guide de création du conteneur Teleport](https://github.com/auyongjinyoo/teleport-setup ) </p>

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
  hostname: '192.168.0.80'                            #
  # ------------------------------------------------- #
  entrypoint: '/bin/sh'                               #
  command: -c "$COMMAND_START2"                       #
  # ------------------------------------------------- #
  ports:                                              #
   - '3023:3023'                                      #
   - '3024:3024'                                      #
   - '3025:3025'                                      #
   - '5080:3080'                                      #
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
public.ecr.aws/gravitational/teleport:10.2.1
```

###### COMMAND_START2
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
public.ecr.aws/gravitational/teleport:10.2.1
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
### III. Génération du lien pour l'ajout de l'utilisateur

#### X. Création du compte
> Coller l'URL dans le navigateur en remplaçant `localhost` par l'adresse ip de la machine et le port.
