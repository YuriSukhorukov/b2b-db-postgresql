docker container rm b2b-db-demo -f

docker run \
-e POSTGRES_DB=b2b \
-e POSTGRES_USER=postgres \
-e POSTGRES_PASSWORD=12345 \
-e PGDATA=/var/lib/postgresql/data/pgdata \
-v postgres_vol_1:/var/lib/postgresql/data \
-p 5433:5432 \
--name b2b-db-demo b2b-db:latest








# docker run \
# -e DB_HOST="host.docker.internal" \
# -e DB_SSL_MODE=disable \
# -e DB_PORT=5432 \
# -e DB_DATABASE=b2b \
# -e DB_USERNAME=postgres \
# -e DB_PASSWORD=12345 \
# -e PRIVATE_KEY="$(cat ./private.key)" \
# -e PUBLIC_KEY="$(cat ./public.key)" \
# -m 100M --cpus="0.5" \
# -p 8080:8080 \
# --name b2b-demo b2b:latest


# -e POSTGRES_PASSWORD=mysecretpassword \