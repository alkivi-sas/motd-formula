#!/bin/bash

USER=`id -u -n`
if [[ "$USER" == "gitlab-runner" ]]; then
    return
fi

for i in `ls /etc/update-motd.d`;
do /etc/update-motd.d/$i;
done
