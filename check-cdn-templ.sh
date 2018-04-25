#!/bin/bash

sudo ln -s /snap/bin/subutai-master /usr/bin

curl https://mastercdn.subutai.io:8338/kurjun/rest/template/list | python -m json.tool | grep id | sed 's,"id": ",,g' | sed 's,",,g' | sed s/,//g > /tmp/abc
cat /tmp/abc

echo "" > /tmp/error.log
echo "" > /tmp/success.log
ID=(cat /tmp/abc)
declare -a arr=($ID)
for i in "${arr[@]}"
do
out=`sudo subutai-master -d import id:$i`
if [ "$?" == 0 ]; then
       echo "$i - success $out" >> /tmp/success.log
else
       echo "$i - failed $out" >> /tmp/error.log
fi
template=`sudo subutai-master list -t | sed -n '3p'`
sudo subutai-master destroy $template
done