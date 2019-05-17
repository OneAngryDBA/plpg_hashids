-- Revert hashids-plgpsql:create.function.hashids.hash from pg

BEGIN;

DROP FUNCTION IF EXISTS hashids.hash(bigint, text, boolean);

COMMIT;
