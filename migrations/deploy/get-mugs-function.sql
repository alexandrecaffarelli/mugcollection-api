-- Deploy mugcollection:get-mugs-function to pg

BEGIN;

CREATE FUNCTION "collection"."get_mugs"() RETURNS SETOF "collection"."mug" AS
$$
    SELECT * FROM "collection"."mug" ORDER BY "id";
$$
LANGUAGE SQL STABLE STRICT; 

COMMIT;
