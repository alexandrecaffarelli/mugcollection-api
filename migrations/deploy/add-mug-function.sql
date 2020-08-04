-- Deploy mugcollection:add-mug-function to pg

BEGIN;

CREATE FUNCTION "new_mug"(
    "lbl" TEXT, "cpt" INT,
    "dscr" TEXT
) RETURNS "mug" AS
$$
    INSERT INTO "mug" ("label", "capacity", "description")
    VALUES ("lbl", "cpt", "dscr") RETURNING *;
$$
LANGUAGE SQL VOLATILE;

COMMIT;
