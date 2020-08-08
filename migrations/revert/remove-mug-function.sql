-- Revert mugcollection:remove-mug-function from pg

BEGIN;

REVOKE EXECUTE ON FUNCTION "collection"."remove_mug"(INT) FROM "mug_family";

DROP FUNCTION "collection"."remove_mug"(INT);

COMMIT;
