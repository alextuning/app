# Build the project
```
docker build -t app:latest .
```

# Run docker image
```
docker run -d -p 5000:5000 -p 8000:8000 --name app-restapi app:latest
```

# Integraion test to make sure the execution file is as we expect
```
GOSS_FILES_PATH=test dgoss run --entrypoint=/test/gossEntrypoint.sh app:latest
```

# Get companies list
```
curl http://<IP>:5000/companies
[{"id": 1, "name": "Company One"}, {"id": 2, "name": "Company Two"}]
```

# Get statistics for time of query execution time in prometheus format
```
curl http://192.168.95.50:8000/companies
# HELP python_gc_objects_collected_total Objects collected during gc
# TYPE python_gc_objects_collected_total counter
python_gc_objects_collected_total{generation="0"} 18.0
python_gc_objects_collected_total{generation="1"} 344.0
python_gc_objects_collected_total{generation="2"} 0.0
...
# HELP request_processing_seconds_created Time spent processing request
# TYPE request_processing_seconds_created gauge
request_processing_seconds_created 1.6338669154315913e+09
```
