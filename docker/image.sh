docker container rm b2b-db-demo -f
docker image rm -f b2b-db:latest
docker build --no-cache -t b2b-db:latest .
docker image prune -f