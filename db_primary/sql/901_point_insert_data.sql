\connect test_db
set role bradmin;
set search_path to test_schema;

insert into test_user(name, password, created_at, audit)
VALUES ('test太郎', 'aaabbbccc', CURRENT_TIMESTAMP, 'test1234567890');