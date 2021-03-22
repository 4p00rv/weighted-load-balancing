# Demo weighted load balancing

### Requirements

- Python


### Tasks

- [x] Node js web server to show statistics
- [x] Dynamic docker-compose file for adding replicas to web server
- [x] nginx as a load balancer

# Usage

The Makefile supports the following command: 

### run

Starts the service.

Options:

- `workers`: Specifies the number of workers.

Example:

```
make run workers=4 # Starts 4 web workers
```

### test

Tests the load balancing by displaying the stats from the workers.

Options:

- `count`: The number of http requests to send.

Example:

```
make test count=100 # Sends 100 http requests and displays the stats
```

### modify

Modifies the Load balancer config file and reloads the config in the container

Options:

- `worker`: Worker ID whose weight needs to be modified.
- `weight`: The new weight.

Example:

```
make modify worker=3 weight=100 # Sets server3 weight to 100
```

### build

Builds the worker image

Example:

```
make build
```

### clean

Stops and removes the containers and intermediate files

Example:

```
make clean
```


