-- Revert mugcollection:add-mug-function from pg

BEGIN;

DROP FUNCTION "new_mug"(TEXT, INT, TEXT);

COMMIT;
