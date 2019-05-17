-- Revert hashids-plgpsql:create.function.hashids.consistent_shuffle from pg

BEGIN;

DROP FUNCTION IF EXISTS hashids.consistent_shuffle(text, text);

COMMIT;
