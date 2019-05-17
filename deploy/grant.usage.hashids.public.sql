-- Deploy hashids-plgpsql:grant.usage.hashids.public to pg
-- requires: create.schema.hashids

BEGIN;

GRANT USAGE ON SCHEMA hashids TO PUBLIC;

COMMIT;
