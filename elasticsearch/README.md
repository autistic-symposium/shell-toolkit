## elastalert hacks

<br>

```
curl -s logs.HOST.com:9200/logstash-2017.09.08/_search\?q=ty_params.ProcessName:osqueryd\&size=10000\&sort=@timestamp:desc | jq -r '.hits.hits[]._source.ty_params.Username' | sort | uniq -c | sort -nr
```

