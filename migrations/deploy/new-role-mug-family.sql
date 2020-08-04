-- Deploy mugcollection:new-role-mug-family to pg

BEGIN;

CREATE FUNCTION "get_random_mug"() RETURNS "mug" AS
$$
    SELECT * FROM "get_mugs"() WHERE "is_clean" = TRUE ORDER BY RANDOM() LIMIT 1;
$$
LANGUAGE SQL VOLATILE STRICT SECURITY DEFINER;

CREATE ROLE "mug_family" WITH LOGIN ENCRYPTED PASSWORD 'family';

GRANT EXECUTE ON FUNCTION "get_random_mug"(), "use_mug"(INT) TO "mug_family";

COMMIT;
