-- Revert mugcollection:clean-mug-function from pg

BEGIN;

DROP FUNCTION "collection"."clean_mug"(INT);

COMMIT;
