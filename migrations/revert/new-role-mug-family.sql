-- Revert mugcollection:new-role-mug-family from pg

BEGIN;

DROP FUNCTION "get_random_mug"();

REVOKE ALL ON ALL FUNCTIONS IN SCHEMA PUBLIC FROM "mug_family";
REVOKE ALL ON ALL TABLES IN SCHEMA PUBLIC FROM "mug_family";

DROP ROLE "mug_family";

COMMIT;
