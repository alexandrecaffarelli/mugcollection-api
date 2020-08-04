-- Revert mugcollection:get-mug-byid-function from pg

BEGIN;

DROP FUNCTION "collection"."get_mug"(INT);

COMMIT;
