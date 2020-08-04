-- Revert mugcollection:mug-schema from pg

BEGIN;

DROP TABLE IF EXISTS "collection"."mug";

DROP SCHEMA IF EXISTS "collection";

COMMIT;
