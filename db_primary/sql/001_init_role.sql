--#########################################
--# drop
--#########################################
DROP ROLE IF EXISTS bradmin;
DROP ROLE IF EXISTS luster;
DROP ROLE IF EXISTS replicator;

--#########################################
--# create
--#########################################
CREATE ROLE bradmin
    WITH SUPERUSER CREATEDB CREATEROLE NOINHERIT LOGIN NOREPLICATION BYPASSRLS CONNECTION LIMIT 1
    PASSWORD 'bradmin';

CREATE ROLE luster
    WITH NOSUPERUSER NOCREATEDB NOCREATEROLE NOINHERIT LOGIN NOREPLICATION BYPASSRLS
    PASSWORD 'luster';

CREATE ROLE replicator
    WITH REPLICATION LOGIN;
