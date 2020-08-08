-- Revert mugcollection:clean-mug-function from pg

BEGIN;

REVOKE EXECUTE ON FUNCTION "collection"."clean_mug"(INT) FROM "mug_family";

DROP FUNCTION "collection"."clean_mug"(INT);

COMMIT;
