docker container rm b2b-db-demo -f

docker volume rm postgres_vol_1
docker volume create postgres_vol_1

docker run \
-e POSTGRES_DB=b2b \
-e POSTGRES_USER=postgres \
-e POSTGRES_PASSWORD=12345 \
-e PGDATA=/var/lib/postgresql/data/pgdata \
-v postgres_vol_1:/var/lib/postgresql/data \
-p 5433:5432 \
--name b2b-db-demo b2b-db:latest