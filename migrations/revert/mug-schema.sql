-- Revert mugcollection:mug-schema from pg

BEGIN;

DROP TABLE "mug";

COMMIT;
