-- Deploy mugcollection:clean-mug-function to pg

BEGIN;

CREATE FUNCTION "collection"."clean_mug"("mug_id" INT) RETURNS "collection"."mug" AS 
$$
    UPDATE "collection"."mug" SET "last_used" = NOW(), "is_clean" = TRUE WHERE "id" = "mug_id" RETURNING *;
$$
LANGUAGE SQL VOLATILE STRICT;

GRANT EXECUTE ON FUNCTION "collection"."clean_mug"(INT) TO "mug_family";

COMMIT;
