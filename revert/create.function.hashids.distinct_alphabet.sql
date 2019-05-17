-- Revert hashids-plgpsql:create.function.hashids.distinct_alphabet from pg

BEGIN;

DROP FUNCTION IF EXISTS hashids.distinct_alphabet(in p_alphabet text);

COMMIT;
