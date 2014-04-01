# Docker DynamoDB Local

This will run the DynamoDB Local dev database inside a Docker container on port 8000.

To build container:
```
docker build -t matt/dynamodb .
```

To run container:
```
docker run -p <External Port>:8000 -t matt/dynamo
```

> NOTE: The data will be destroyed when you kill the instance.
