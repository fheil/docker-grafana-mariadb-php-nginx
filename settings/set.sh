#!/bin/sh

sed -i 's/memory_limit = 2M/memory_limit= 32M/g' /etc/php81/php.ini
sed -i 's/upload_max_filesize = 2M/upload_max_filesize = 32M/g' /etc/php81/php.ini
sed -i 's/post_max_size = 8M/post_max_size = 48M/g' /etc/php81/php.ini

tail -f /dev/null
