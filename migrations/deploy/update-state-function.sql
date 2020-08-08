BEGIN;

CREATE FUNCTION "collection"."update_state_mug"("mug_id" INT, "new_state" TEXT) RETURNS "collection"."mug" AS 
$$
    UPDATE "collection"."mug" SET "state" = "new_state" WHERE "id" = "mug_id" RETURNING *;
$$
LANGUAGE SQL VOLATILE STRICT;

GRANT EXECUTE ON FUNCTION "collection"."update_state_mug"(INT, TEXT) TO "mug_family";

COMMIT;