### Afficher l'arborescence d'un package
```bash
clear;
dpkg -L apache2;
dpkg -L apache2 | grep -v ".gz\|.service\|.conf\|.load"       | sort -n;
dpkg -L mariadb-server | grep -v ".gz\|.txt\|.sh\|.so\|.conf" | sort -n;
```

```
/etc/apache2
/etc/cron.daily/apache2
/etc/default/apache-htcacheclean
/etc/init.d/apache-htcacheclean
/etc/init.d/apache2
/etc/logrotate.d/apache2
/usr/sbin/a2dismod
/usr/sbin/a2dissite
/usr/sbin/a2enmod
/usr/sbin/a2ensite
/usr/sbin/a2query
/usr/sbin/apache2ctl
/usr/sbin/apachectl
/usr/share/apache2
/usr/share/bug/apache2
/usr/share/lintian
/usr/share/lintian/overrides
/usr/share/lintian/overrides/apache2
/var/cache/apache2
/var/cache/apache2/mod_cache_disk
/var/lib/apache2
/var/log/apache2
/var/www/html
```

```
/etc/logcheck/ignore.d.paranoid/mariadb-server
/etc/logcheck/ignore.d.server/mariadb-server
/etc/logcheck/ignore.d.workstation/mariadb-server
/etc/logrotate.d/mariadb
/etc/mysql/debian-start
/lib/systemd/system/mariadb.service
/lib/systemd/system/mariadb@.service
/lib/systemd/system/mariadb@bootstrap.service.d
/lib/systemd/system/mysql.service
/lib/systemd/system/mysqld.service

/usr/bin/mariadb-service-convert
/usr/bin/mariadbd-multi
/usr/bin/mariadbd-safe
/usr/bin/mariadbd-safe-helper
/usr/bin/myisam_ftdump
/usr/bin/myisamchk
/usr/bin/myisamlog
/usr/bin/myisampack
/usr/bin/mysql_convert_table_format
/usr/bin/mysql_plugin
/usr/bin/mysql_secure_installation
/usr/bin/mysql_setpermission
/usr/bin/mysql_tzinfo_to_sql
/usr/bin/mysqlbinlog
/usr/bin/mysqld_multi
/usr/bin/mysqld_safe
/usr/bin/mysqld_safe_helper
/usr/bin/mysqlhotcopy

/usr/lib/mysql
/usr/lib/mysql/plugin
```
