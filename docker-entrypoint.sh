#!/bin/bash
set -e

if [[ "$1" == nginx ]] || [ "$1" == php-fpm ]; 
then
  echo "Running PHP-FPM ..."
  php-fpm --allow-to-run-as-root #--nodaemonize can stop run in foreground but we already have nginx in foreground so no issue with docker.
  echo "Running Nginx ..."
  nginx -g 'daemon off;'
else
 exec "$@"
fi
