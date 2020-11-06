FROM library/postgres

ENV POSTGRES_DB b2b
ENV POSTGRES_USER postgres
ENV POSTGRES_PASSWORD 12345

COPY /sql/CreateDB.sql /docker-entrypoint-initdb.d/