-- Deploy mugcollection:get-mug-byid-function to pg

BEGIN;

CREATE FUNCTION "collection"."get_mug"("mug_id" INT) RETURNS "collection"."mug" AS
$$
    SELECT * FROM "collection"."mug" WHERE "id" = "mug_id";
$$
LANGUAGE SQL STABLE STRICT; 

COMMIT;
