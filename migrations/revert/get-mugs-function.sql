-- Revert mugcollection:get-mugs-function from pg

BEGIN;

DROP FUNCTION "collection"."get_mugs"();

COMMIT;
