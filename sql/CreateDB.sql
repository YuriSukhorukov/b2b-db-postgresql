-- CREATE DATABASE b2b
--     WITH 
--     OWNER = postgres
--     ENCODING = 'UTF8'
--     CONNECTION LIMIT = -1;

CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

CREATE TABLE users (
    user_id uuid NOT NULL PRIMARY KEY DEFAULT uuid_generate_v4 (),
    email VARCHAR(255) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    token VARCHAR(255),
    created_on TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);
CREATE TABLE companies (
    company_id uuid NOT NULL PRIMARY KEY DEFAULT uuid_generate_v4 (),
    user_id uuid NOT NULL UNIQUE,
    legal_type VARCHAR(8) NOT NULL,
    company_name VARCHAR(128) NOT NULL,
    tax_id NUMERIC(19,0) UNIQUE,
    created_on TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_on TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);
CREATE TABLE offers (
    offer_id uuid NOT NULL PRIMARY KEY DEFAULT uuid_generate_v4 (),
    user_id uuid NOT NULL,
    title VARCHAR(255) NOT NULL,
    description VARCHAR(255) NOT NULL,
    price NUMERIC(19,6) NOT NULL,
    amount NUMERIC(19,0) NOT NULL,
    currency_code VARCHAR(8) NOT NULL,
    offer_type VARCHAR(16) NOT NULL,
    measure_unit_code VARCHAR(16) NOT NULL,
    country VARCHAR(255) NOT NULL,
    city VARCHAR(255) NOT NULL,
    date_publication TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    date_expires TIMESTAMP NOT NULL,
    created_on TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);
CREATE TABLE proposals (
    proposal_id uuid DEFAULT uuid_generate_v4 (),
    user_id uuid NOT NULL,
    offer_id uuid NOT NULL,
    created_on TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    UNIQUE (user_id, offer_id),
    FOREIGN KEY (offer_id) 
        REFERENCES offers (offer_id)
        ON DELETE CASCADE
);