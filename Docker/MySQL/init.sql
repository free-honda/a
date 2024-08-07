DROP DATABASE chatapp;
DROP USER 'testuser';

CREATE USER 'testuser' IDENTIFIED BY 'testuser';
CREATE DATABASE chatapp;
USE chatapp
GRANT ALL PRIVILEGES ON chatapp.* TO 'testuser';

CREATE TABLE users (
    uid varchar(255) PRIMARY KEY,
    username varchar(255) UNIQUE NOT NULL,
    email varchar(255) UNIQUE NOT NULL,
    password varchar(255) NOT NULL,
    address varchar(255) NOT NULL,
    greeting varchar(255) NOT NULL
);

CREATE TABLE channels (
    id serial PRIMARY KEY,
    uid varchar(255) REFERENCES users(uid),
    name varchar(255) UNIQUE NOT NULL,
    abstract varchar(255)
);

CREATE TABLE messages (
    id serial PRIMARY KEY,
    uid varchar(255) REFERENCES users(uid),
    cid integer REFERENCES channels(id) ON DELETE CASCADE,
    message text,
    created_at timestamp not null default current_timestamp
);

INSERT INTO users(uid, username, email, password, address, greeting)  -- 「users」テーブルに値を挿入する
VALUES('970af84c-dd40-47ff-af23-282b72b7cca8', 'テスト', 'test@gmail.com', '37268335dd6931045bdcdf92623ff819a64244b53d0e746d438797349d4da578','東京','こんにちは');

INSERT INTO channels(id, uid, name, abstract)  -- 「channels」テーブルに値を挿入する
VALUES(1, '970af84c-dd40-47ff-af23-282b72b7cca8', 'ぼっち部屋', 'テストさんの孤独な部屋です');

INSERT INTO messages(id, uid, cid, message)  -- 「messages」テーブルに値を挿入する
VALUES(1, '970af84c-dd40-47ff-af23-282b72b7cca8', 1, '誰かかまってください、、');