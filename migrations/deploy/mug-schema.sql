-- Deploy mugcollection:mug-schema to pg

BEGIN;

CREATE SCHEMA "collection";

CREATE TABLE "collection"."mug" (
    "id" INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    "label" TEXT NOT NULL UNIQUE,
    "capacity" INT NOT NULL DEFAULT 250, --in ml
    "last_used" TIMESTAMP WITH TIME ZONE,
    "is_clean" BOOLEAN NOT NULL DEFAULT TRUE,
    "description" TEXT,
    "state" TEXT NOT NULL DEFAULT 'Nothing to report'
);

COMMIT;
