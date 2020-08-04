-- Revert mugcollection:add-mug-function from pg

BEGIN;

DROP FUNCTION "collection"."new_mug"(JSON);

COMMIT;
