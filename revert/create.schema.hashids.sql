-- Revert hashids-plgpsql:create.schema.hashids from pg

BEGIN;

DROP SCHEMA IF EXISTS hashids;

COMMIT;
