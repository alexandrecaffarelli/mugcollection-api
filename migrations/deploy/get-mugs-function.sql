-- Deploy mugcollection:get-mugs-function to pg

BEGIN;

CREATE FUNCTION "get_mugs"() RETURNS SETOF "mug" AS
$$
    SELECT * FROM "mug" ORDER BY "id";
$$
LANGUAGE SQL STABLE STRICT; 

COMMIT;
