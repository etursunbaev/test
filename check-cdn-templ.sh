#!/bin/bash

set -e
curl https://mastercdn.subutai.io:8338/kurjun/rest/template/list | python -m json.tool | grep id | sed 's,"id": ",,g' | sed 's,",,g' | sed s/,//g > /tmp/abc
cat /tmp/abc
