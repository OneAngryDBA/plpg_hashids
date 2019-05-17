-- Revert hashids-plgpsql:create.function.hashids.decode from pg

BEGIN;

DROP FUNCTION IF EXISTS hashids.decode(text, text, integer, text, boolean);
-- Including the Alt function here because I'm too tired to debug this completely
-- Since its not my code i've renamed the function which is erroring.
-- I'll do more tests to make sure that I can kill off this function.
DROP FUNCTION IF EXISTS hashids.decode_alt(text, text, integer, text, boolean);
DROP FUNCTION IF EXISTS hashids.decode(text, text, integer, text);
DROP FUNCTION IF EXISTS hashids.decode(text, text, integer);
DROP FUNCTION IF EXISTS hashids.decode(text, text);
DROP FUNCTION IF EXISTS hashids.decode(text);

COMMIT;
