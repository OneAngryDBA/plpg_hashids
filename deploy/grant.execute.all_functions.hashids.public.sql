-- Deploy hashids-plgpsql:grant.execute.all_functions.hashids.public to pg
-- requires: create.schema.hashids

BEGIN;

GRANT EXECUTE ON ALL FUNCTIONS IN SCHEMA hashids TO PUBLIC;

COMMIT;
