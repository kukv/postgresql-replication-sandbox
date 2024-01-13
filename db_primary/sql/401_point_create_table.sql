\connect test_db
set role bradmin;
set search_path to test_schema;

--#########################################
--# drop
--#########################################
DROP TABLE IF EXISTS test_user;

--#########################################
--# create
--#########################################
CREATE TABLE test_user
(
    id          serial                      NOT NULL PRIMARY KEY,
    name        varchar(50)                 NOT NULL,
    password    varchar(50)                 NOT NULL,
    created_at  timestamp without time zone NOT NULL DEFAULT CURRENT_TIMESTAMP,
    audit       varchar(255)                NOT NULL
);
COMMENT ON TABLE test_user                IS 'テストユーザー';
COMMENT ON COLUMN test_user.id            IS 'ID';
COMMENT ON COLUMN test_user.name          IS '名前';
COMMENT ON COLUMN test_user.password      IS 'パスワード';
COMMENT ON COLUMN test_user.created_at    IS '作成日時';
COMMENT ON COLUMN test_user.audit         IS '作成者';
