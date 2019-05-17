-- Revert hashids-plgpsql:create.function.hashids.clean_seps_from_alphabet from pg

BEGIN;

DROP FUNCTION IF EXISTS hashids.clean_seps_from_alphabet(text,text);

COMMIT;
