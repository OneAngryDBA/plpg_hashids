-- Revert hashids-plgpsql:grant.execute.all_functions.hashids.public from pg

BEGIN;

REVOKE EXECUTE ON ALL FUNCTIONS IN SCHEMA hashids FROM PUBLIC;

COMMIT;
