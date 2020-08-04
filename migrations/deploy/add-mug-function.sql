-- Deploy mugcollection:add-mug-function to pg

BEGIN;

CREATE OR REPLACE FUNCTION "new_mug"("new_mug_data" JSON) RETURNS "mug" AS
$$
    INSERT INTO "mug" ("label", "capacity", "description", "state")
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
