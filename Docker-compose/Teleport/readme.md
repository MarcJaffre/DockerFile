------------------------------------------------------------------------------------------
<p align='center'> Guide de création du conteneur Teleport </p>

------------------------------------------------------------------------------------------

### Phase 1: Creation des conteneurs
> Aller dans Portainer
> Créer un stack
> Ajouter les variables
> Démarrer le Stack


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

------------------------------------------------------------------------------------------

## Phase 2: Génération du lien pour l'ajout de l'utilisateur
> Ajouter un utilisateur Teleport via la commande suivante.
```bash
clear;
docker exec teleport tctl users add marc --roles=editor,access --logins=root
```
## Phase 3: Création du compte
> Coller l'URL en remplaçant localhost par l'ip de la machine


# 
# 
################################################################################################################################


