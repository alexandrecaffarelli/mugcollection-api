-- Deploy mugcollection:get-mugs-function to pg

BEGIN;

CREATE FUNCTION "get_mugs"() RETURNS SETOF "mug" AS
$$
    SELECT * FROM "mug" ORDER BY "id";
$$
LANGUAGE SQL STABLE STRICT; 

CREATE FUNCTION "get_random_mug"() RETURNS "mug" AS
$$
    SELECT * FROM "get_mugs"() ORDER BY RANDOM() LIMIT 1;
$$
LANGUAGE SQL VOLATILE STRICT;

COMMIT;
