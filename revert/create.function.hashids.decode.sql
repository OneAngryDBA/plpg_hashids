-- Revert hashids-plgpsql:create.function.hashids.decode from pg

BEGIN;

DROP FUNCTION if exists hashids.decode(text, text, integer, text, boolean);
DROP FUNCTION if exists hashids.decode(text, text, integer, text);
DROP FUNCTION if exists hashids.decode(text, text, integer);
DROP FUNCTION if exists hashids.decode(text, text);
DROP FUNCTION if exists hashids.decode(text);

COMMIT;
