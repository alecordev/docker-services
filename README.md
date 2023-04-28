# dev-containers

Templates and examples of ready to use Dockerfile and docker-compose for solutions.

Ready to use:

- servers
- dev boxes
- components

## Shell into the containers

- `docker exec -it <container_name> /bin/sh`

## Services

PostgreSQL:
    Port: 5432
    postgres:postgres:postgres

Prometheus: http://localhost:9090/

Grafana: http://localhost:3000/

MongoDB:
    host="localhost",
    port=27017,
    username="admin",
    password="admin",
    authSource="admin",
    Mongo Express: http://localhost:8081

Redis:
    Port: 6379
    Password: password

RabbitMQ:
    Port: 5672  # AMQP
    Port: 15672  # web
