#############################################################################
# Group ADD #
#############
/usr/sbin/groupadd -g $GUID $GROUP

#############################################################################
# Creation d-un utilisateur #
#############################
/usr/sbin/useradd -g $GROUP -u $UID $USERNAME


