##############################################################################################
# Nettoyage du systeme #
########################
 apt clean autoclean;
 apt autoremove --yes;
 rm -rf /var/lib/{apt,dpkg,cache,log}/;
