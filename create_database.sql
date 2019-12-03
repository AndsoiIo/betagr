create database :db;
create user :db_user;
alter database :db owner to :db_user;
ALTER USER :db_user WITH ENCRYPTED PASSWORD :pw;