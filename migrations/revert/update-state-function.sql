BEGIN;

REVOKE EXECUTE ON FUNCTION "collection"."update_state_mug"(INT, TEXT) FROM "mug_family";

DROP FUNCTION "collection"."update_state_mug"(INT, TEXT);

COMMIT;