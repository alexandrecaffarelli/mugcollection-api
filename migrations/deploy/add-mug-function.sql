-- Deploy mugcollection:add-mug-function to pg

BEGIN;

CREATE FUNCTION "collection"."new_mug"(
    "lbl" TEXT, "cpt" INT,
    "dscr" TEXT
) RETURNS "collection"."mug" AS
$$
    INSERT INTO "collection"."mug" ("label", "capacity", "description")
    VALUES ("lbl", "cpt", "dscr") RETURNING *;
$$
LANGUAGE SQL VOLATILE;

COMMIT;
