### Afficher l'arborescence d'un package
```bash
clear;
dpkg -L apache2;
dpkg -L apache2 | grep -v ".gz\|.service\|.conf\|.load"
```

```
/etc
/etc/apache2
/etc/apache2/envvars
/etc/apache2/magic
/etc/apache2/mods-available
/etc/apache2/mods-enabled
/etc/apache2/sites-available
/etc/apache2/sites-enabled
/etc/cron.daily
/etc/cron.daily/apache2
/etc/default
/etc/default/apache-htcacheclean
/etc/init.d
/etc/init.d/apache-htcacheclean
/etc/init.d/apache2
/etc/logrotate.d
/etc/logrotate.d/apache2

/lib
/lib/systemd
/lib/systemd/system

/usr
/usr/lib
/usr/lib/cgi-bin

/usr/sbin
/usr/sbin/a2enmod
/usr/sbin/a2query
/usr/sbin/apache2ctl

/usr/share
/usr/share/apache2
/usr/share/apache2/apache2-maintscript-helper
/usr/share/apache2/ask-for-passphrase
/usr/share/bash-completion
/usr/share/bash-completion/completions
/usr/share/bash-completion/completions/a2enmod
/usr/share/bug
/usr/share/bug/apache2
/usr/share/doc
/usr/share/doc/apache2
/usr/share/doc/apache2/NOTICE
/usr/share/doc/apache2/README.backtrace
/usr/share/doc/apache2/README.multiple-instances
/usr/share/doc/apache2/copyright
/usr/share/doc/apache2/examples
/usr/share/doc/apache2/examples/apache2.monit
/usr/share/doc/apache2/examples/secondary-init-script
/usr/share/doc/apache2/examples/setup-instance
/usr/share/lintian
/usr/share/lintian/overrides
/usr/share/lintian/overrides/apache2
/usr/share/man
/usr/share/man/man1
/usr/share/man/man8

/var
/var/cache
/var/cache/apache2
/var/cache/apache2/mod_cache_disk
/var/lib
/var/lib/apache2
/var/log
/var/log/apache2
/var/www
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
