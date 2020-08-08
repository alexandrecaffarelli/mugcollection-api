-- Revert mugcollection:get-cleaned-mugs-view from pg

BEGIN;

REVOKE SELECT ON "collection"."get_cleaned_mugs" FROM "mug_family";

DROP VIEW "collection"."get_cleaned_mugs";

COMMIT;
