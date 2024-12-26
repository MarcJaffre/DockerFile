### Phase 1: Creation des conteneurs
> Aller dans Portainer
> Créer un stack
> Ajouter les variables

### Phase 2

# TELEPORT_IMAGE =  public.ecr.aws/gravitational/teleport:10.2.1
# COMMAND_START1 =  if [ ! -f /etc/teleport/teleport.yaml ]; then teleport configure > /etc/teleport/teleport.yaml; fi
# COMMAND_START2 =  sleep 1 && /bin/dumb-init teleport start -c /etc/teleport/teleport.yaml
# 
# docker exec teleport tctl users add marc --roles=editor,access --logins=root
################################################################################################################################


