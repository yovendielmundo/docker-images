#!/bin/bash
# wait-for-selenium-hub.sh

set -e

host="$1"
shift
cmd="$@"

# option 1
until wget --spider ${host} 2>&1 | grep -q "200 OK"; do
  >&2 echo "selenium-hub is unavailable - sleeping"
  sleep 1
done

# option 2
#until [ $(curl -I -s ${host} -o /dev/null -w "%{http_code}") -eq 200 ]; do
#  >&2 echo "selenium-hub is unavailable - sleeping"
#  sleep 1
#done

>&2 echo "selenium-hub is up - executing command"
exec $cmd
