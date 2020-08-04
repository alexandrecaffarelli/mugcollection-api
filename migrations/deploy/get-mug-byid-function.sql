-- Deploy mugcollection:get-mug-byid-function to pg

BEGIN;

CREATE FUNCTION "get_mug"("mug_id" INT) RETURNS "mug" AS
$$
    SELECT * FROM "mug" WHERE "id" = "mug_id";
$$
LANGUAGE SQL STABLE STRICT; 

COMMIT;
