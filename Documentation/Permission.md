### Afficher l'arborescence d'un package
```bash
clear;
dpkg -L apache2;
dpkg -L apache2 | grep -v ".gz\|.service\|.conf\|.load" | sort -n
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
