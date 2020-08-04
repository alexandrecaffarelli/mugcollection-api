-- Revert mugcollection:remove-mug-function from pg

BEGIN;

DROP FUNCTION "collection"."remove_mug"(INT);

COMMIT;
