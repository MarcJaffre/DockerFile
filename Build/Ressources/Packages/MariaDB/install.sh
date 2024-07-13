####################################################################################################################################################################################
# Installation de MariaDB #
###########################
apt install -y mariadb-server 1>/dev/null;
sleep 5;

echo "[mysqld]
datadir      = /var/lib/mysql
bind-address = 0.0.0.0
port         = 3306
skip-grant-tables" > /etc/mysql/my.cnf
