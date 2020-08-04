-- Deploy mugcollection:get-mug-byid-function to pg

BEGIN;

CREATE FUNCTION "get_mug"("id" INT) RETURNS "mug" AS
$$
    SELECT * FROM "mug" WHERE "id" = "id";
$$
LANGUAGE SQL STABLE STRICT; 

COMMIT;
