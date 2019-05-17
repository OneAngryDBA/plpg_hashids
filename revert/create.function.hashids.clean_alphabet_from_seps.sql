-- Revert hashids-plgpsql:create.function.hashids.clean_alphabet_from_seps from pg

BEGIN;

DROP FUNCTION IF EXISTS hashids.clean_alphabet_from_seps(text,text);

COMMIT;
