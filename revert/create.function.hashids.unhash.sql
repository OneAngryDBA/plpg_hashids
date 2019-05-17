-- Revert hashids-plgpsql:create.function.hashids.unhash from pg

BEGIN;

DROP FUNCTION IF EXISTS hashids.unhash(text, text, boolean);

COMMIT;
