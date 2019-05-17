-- Revert hashids-plgpsql:create.function.hashids.setup_alphabet from pg

BEGIN;

DROP FUNCTION IF EXISTS hashids.setup_alphabet(text,text,text,text)

COMMIT;
