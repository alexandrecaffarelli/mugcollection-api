-- Deploy mugcollection:add-mug-function to pg

BEGIN;

CREATE OR REPLACE FUNCTION "collection"."new_mug"("new_mug_data" JSON) RETURNS "collection"."mug" AS
$$
    INSERT INTO "collection"."mug" ("label", "capacity", "description", "state")
    VALUES (
        "new_mug_data"->>'label' ,
        ("new_mug_data"->>'capacity')::INT,
        "new_mug_data"->>'description',
        "new_mug_data"->>'state'
    )
    RETURNING *;
$$
LANGUAGE SQL VOLATILE;

COMMIT;
