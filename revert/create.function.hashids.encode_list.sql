-- Revert hashids-plgpsql:create.function.hashids.encode_list from pg

BEGIN;

DROP FUNCTION IF EXISTS hashids.encode_list(bigint[], text, integer, text, boolean);
-- DROP FUNCTION IF EXISTS hashids.encode_list(bigint[], text, integer, text);
DROP FUNCTION IF EXISTS hashids.encode_list(bigint[], text, integer);
DROP FUNCTION IF EXISTS hashids.encode_list(bigint[], text);
DROP FUNCTION IF EXISTS hashids.encode_list(bigint[]);

COMMIT;
