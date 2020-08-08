-- Deploy mugcollection:get-cleaned-mugs-view to pg

BEGIN;

CREATE OR REPLACE VIEW "collection"."get_cleaned_mugs" 

AS

SELECT * 
FROM "collection"."mug" m
WHERE m.is_clean = 'true';

GRANT SELECT ON "collection"."get_cleaned_mugs" TO "mug_family";

COMMIT;
