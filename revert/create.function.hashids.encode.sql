-- Revert hashids-plgpsql:create.function.hashids.encode from pg

BEGIN;

DROP FUNCTION IF EXISTS hashids.encode(bigint);
DROP FUNCTION IF EXISTS hashids.encode(bigint, text);
DROP FUNCTION IF EXISTS hashids.encode(bigint, text, integer);
DROP FUNCTION IF EXISTS hashids.encode(bigint, text, integer, text);
DROP FUNCTION IF EXISTS hashids.encode(bigint, text, integer, text, boolean);

COMMIT;
