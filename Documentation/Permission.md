### Afficher l'arborescence d'un package
```bash
clear;
dpkg -L apache2;
dpkg -L apache2 | grep -v ".gz\|.service\|.conf\|.load"
```

```
/etc
/etc/apache2
/etc/cron.daily/apache2
/etc/default/apache-htcacheclean
/etc/init.d/apache-htcacheclean
/etc/init.d/apache2
/etc/logrotate.d/apache2
/usr/sbin/a2enmod
/usr/sbin/a2query
/usr/sbin/apache2ctl

/usr/share/apache2
/usr/share/bash-completion
/usr/share/bug
/usr/share/doc
/usr/share/lintian
/usr/share/man
/var/cache/apache2
/var/lib/apache2
/var/log/apache2
/var/www/html

/usr/sbin/a2dismod
/usr/sbin/a2dissite
/usr/sbin/a2ensite
/usr/sbin/apachectl

/usr/share/bash-completion/completions/a2dismod
/usr/share/bash-completion/completions/a2dissite
/usr/share/bash-completion/completions/a2ensite
/usr/share/bug/apache2/control
/usr/share/bug/apache2/script
```
