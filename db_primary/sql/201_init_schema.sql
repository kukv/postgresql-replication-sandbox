\connect test_db
set role bradmin;

--#########################################
--# drop
--#########################################
DROP SCHEMA IF EXISTS test_schema CASCADE;

--#########################################
--# create
--#########################################
CREATE SCHEMA test_schema;

COMMENT ON SCHEMA test_schema is 'テストスキーマ';

GRANT USAGE ON SCHEMA test_schema TO luster;

ALTER DEFAULT PRIVILEGES
    GRANT SELECT, INSERT, UPDATE, DELETE, TRUNCATE
    ON TABLES
    TO luster;

ALTER DEFAULT PRIVILEGES
    GRANT USAGE, SELECT, UPDATE
    ON SEQUENCES
    TO luster;