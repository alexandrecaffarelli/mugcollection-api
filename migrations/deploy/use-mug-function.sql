-- Deploy mugcollection:use-mug-function to pg

BEGIN;

CREATE FUNCTION "collection"."use_mug"("mug_id" INT) RETURNS "collection"."mug" AS 
$$
    UPDATE "collection"."mug" SET "last_used" = NOW(), "is_clean" = FALSE WHERE "id" = "mug_id" RETURNING *;
$$
LANGUAGE SQL VOLATILE STRICT;

COMMIT;
