CREATE KEYSPACE my_keyspace
WITH REPLICATION = { 'class' : 'SimpleStrategy', 'replication_factor' : 1 };

USE my_keyspace;

CREATE TABLE logs(id UUID, created_by text, created_at timestamp, referral text, command text, signature text, lang text, primary key(id));

CREATE TABLE users(id UUID, created_at timestamp, modified_at timestamp, name text, last_name text, email text, active varint, alias text, lang text, primary key(id));
