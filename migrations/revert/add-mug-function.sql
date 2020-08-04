-- Revert mugcollection:add-mug-function from pg

BEGIN;

DROP FUNCTION "collection"."new_mug"(TEXT, INT, TEXT);

COMMIT;
