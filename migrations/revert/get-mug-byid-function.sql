-- Revert mugcollection:get-mug-byid-function from pg

BEGIN;

DROP FUNCTION "get_mug"(INT);

COMMIT;
