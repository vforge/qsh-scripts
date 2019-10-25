# Create new DB

```bash
$> curl -XPOST 'http://localhost:8086/query' --data-urlencode 'q=CREATE DATABASE <DBNAME>'
```

# Current DB list

```bash
$> curl -G http://localhost:8086/query?pretty=true --data-urlencode "db=glances" --data-urlencode "q=SHOW DATABASES"
```
