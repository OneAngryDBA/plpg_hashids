-- Deploy hashids-plgpsql:create.schema.hashids to pg

BEGIN;

-- Our usage of these functions places all of them in a separate schema, with 
-- "hashids" being the default name change this or don't use it (but know that
-- the other sql functions will not work out of the box, they are assuming the 
-- hashids schema). 
CREATE SCHEMA hashids;


COMMIT;
