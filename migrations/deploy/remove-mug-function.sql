-- Deploy mugcollection:remove-mug-function to pg

BEGIN;

CREATE FUNCTION "collection"."remove_mug"("mug_id" INT) RETURNS "collection"."mug" AS
$$
    DELETE FROM "collection"."mug" WHERE "id" = "mug_id" RETURNING *;
$$
LANGUAGE SQL VOLATILE STRICT;

COMMIT;
