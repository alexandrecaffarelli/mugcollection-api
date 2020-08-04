-- Deploy mugcollection:use-mug-function to pg

BEGIN;

CREATE FUNCTION "use_mug"("mug_id" INT) RETURNS "mug" AS 
$$
    UPDATE "mug" SET "last_usage" = NOW(), "is_clean" = FALSE WHERE "id" = "mug_id" RETURNING *;
$$
LANGUAGE SQL VOLATILE STRICT;

COMMIT;
