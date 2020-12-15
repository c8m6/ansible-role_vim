#!/bin/bash
#
# wrapper to run the playbook

ansible="$(readlink -e "$(type -P ansible-playbook)")"
self="$(basename "$0")"
rc=0
if [ ! -z "$ansible" ] && [ -x "$ansible" ]
then
  standalone_yml="$(readlink -f "$(dirname "$0")")/standalone.yml"
  if [ ! -z "$standalone_yml" ] && [ -e "$standalone_yml" ]
  then
    ansible-playbook -i 'localhost,' --connection=local -K "$standalone_yml"
    rc=$?
  else
    echo "${self}: Missing standalone.yml"
    exit 1
  fi
else
  echo "${self}: Please install ansible to run this playbook."
  exit 1
fi

exit $rc

