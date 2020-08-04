-- Revert mugcollection:use-mug-function from pg

BEGIN;

DROP FUNCTION "use_mug"(INT);

COMMIT;
