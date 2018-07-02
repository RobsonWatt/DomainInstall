#!/bin/bash
#set -x

IFS='|' read -r -a grupo <<< $1
profile=${grupo[1]}
nombre=${grupo[0]}
socket=${grupo[2]}


$2/bin/jboss-cli.sh -c controller=$3:9999 --command="/server-group=$nombre:add(profile=$profile,socket-binding-group=$socket"
$2/bin/jboss-cli.sh -c controller=$3:9999 --command="/server-group=$nombre/jvm=default:add()"
