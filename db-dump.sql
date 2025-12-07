-- ------------------------------------------------------
-- Dump file: arcade_mania_datas_dump.sql
-- Cél: arcade_mania_datas adatbázis
-- Normalizált, GUID-alapú, többjátékos high score rendszer
-- ------------------------------------------------------

-- Ha már létezik az adatbázis, töröljük (óvatosan!)
DROP DATABASE IF EXISTS arcade_mania_datas;

-- Adatbázis létrehozása
CREATE DATABASE IF NOT EXISTS arcade_mania_datas
  DEFAULT CHARACTER SET utf8mb4
  DEFAULT COLLATE utf8mb4_hungarian_ci;

-- Adatbázis használata
USE arcade_mania_datas;

-- ------------------------------------------------------
-- users tábla
-- ------------------------------------------------------
CREATE TABLE IF NOT EXISTS users (
    id            CHAR(36)       NOT NULL,     -- GUID (C# Guid)
    user_name     VARCHAR(100)   NOT NULL,
    password_hash CHAR(60)       NOT NULL,     -- hash-elt jelszó (pl. bcrypt)
    PRIMARY KEY (id),
    UNIQUE KEY uq_users_user_name (user_name)
);

-- ------------------------------------------------------
-- games tábla (GUID azonosítóval)
-- ------------------------------------------------------
CREATE TABLE IF NOT EXISTS games (
    id    CHAR(36)      NOT NULL, -- GUID
    name  VARCHAR(100)  NOT NULL,
    PRIMARY KEY (id)
);

-- ------------------------------------------------------
-- user_high_scores kapcsolótábla
-- ------------------------------------------------------
CREATE TABLE IF NOT EXISTS user_high_scores (
    user_id    CHAR(36)        NOT NULL,  -- GUID → users.id
    game_id    CHAR(36)        NOT NULL,  -- GUID → games.id
    high_score INT UNSIGNED    NOT NULL DEFAULT 0,
    PRIMARY KEY (user_id, game_id),
    CONSTRAINT fk_user_high_scores_user
        FOREIGN KEY (user_id) REFERENCES users(id)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    CONSTRAINT fk_user_high_scores_game
        FOREIGN KEY (game_id) REFERENCES games(id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

-- ------------------------------------------------------
-- (Opcionális) Minta adatok
-- ------------------------------------------------------

-- Játékok (fix játék ID-k, ne változtassuk meg őket, fontos hogy ezek az ID-k legyenek)
-- INSERT INTO games (id, name)
-- VALUES
-- ('dd4c7870-d2a4-11f0-906c-fc5cee8cf808', 'Fighter'),
-- ('dd4c8625-d2a4-11f0-906c-fc5cee8cf808', 'Memory'),
-- ('dd4c8740-d2a4-11f0-906c-fc5cee8cf808', 'Snake');

-- Felhasználók
-- FONTOS: password_hash mezőbe már hash-elt jelszó kerüljön!
-- INSERT INTO users (id, user_name, password_hash)
-- VALUES
-- (UUID(), 'Player1', '<bcrypt_hash>'),
-- (UUID(), 'Player2', '<bcrypt_hash>');

-- High score-ok
-- INSERT INTO user_high_scores (user_id, game_id, high_score)
-- VALUES
-- ('<Player1_GUID>', '<Snake_GUID>', 1200);
