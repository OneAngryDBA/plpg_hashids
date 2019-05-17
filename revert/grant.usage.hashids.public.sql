-- Revert hashids-plgpsql:grant.usage.hashids.public from pg

BEGIN;

REVOKE USAGE ON SCHEMA hashids FROM PUBLIC;

COMMIT;
