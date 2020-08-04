-- Revert mugcollection:get-mugs-function from pg

BEGIN;

DROP FUNCTION "get_mugs"();

COMMIT;
