curl https://mastercdn.subutai.io:8338/kurjun/rest/template/list | python -m json.tool | grep id | sed 's,"id": ",,g' | sed 's,",,g' | sed 's/.\$//' > /tmp/abc
cat /tmp/abc'
