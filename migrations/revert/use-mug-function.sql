-- Revert mugcollection:use-mug-function from pg

BEGIN;

DROP FUNCTION "collection"."use_mug"(INT);

COMMIT;
