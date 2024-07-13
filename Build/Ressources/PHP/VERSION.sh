#!/usr/bin/bash
echo $(php --version | head -n 1 | cut -c 5-7) > /etc/apache2/VERSION
