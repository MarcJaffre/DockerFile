------------------------------------------------------------------------------------------
# <p align='center'> Guide de création du conteneur Teleport </p>

------------------------------------------------------------------------------------------
### I. Portainer (Méthode 1)
#### A. Teleport.yml
Création du fichier telepo

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

<br />
<br />

------------------------------------------------------------------------------------------
### III. Génération du lien pour l'ajout de l'utilisateur
> Ajouter un utilisateur Teleport via la commande suivante.
```bash
clear;
docker exec teleport tctl users add marc --roles=editor,access --logins=root
```
## Phase 3: Création du compte
> Coller l'URL dans le navigateur en remplaçant `localhost` par l'adresse ip de la machine.
