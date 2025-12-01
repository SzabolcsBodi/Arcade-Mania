-- ------------------------------------------------------
-- Dump file: game_scores_db_dump.sql
-- Cél: game_scores_db adatbázis + users tábla
-- ------------------------------------------------------

-- Ha már létezik az adatbázis, töröljük (óvatosan!)
DROP DATABASE IF EXISTS game_scores_db;

-- Adatbázis létrehozása
CREATE DATABASE IF NOT EXISTS game_scores_db
  DEFAULT CHARACTER SET utf8mb4
  DEFAULT COLLATE utf8mb4_hungarian_ci;

-- Adatbázis használata
USE game_scores_db;

-- Tábla létrehozása
CREATE TABLE IF NOT EXISTS users (
    id INT UNSIGNED NOT NULL AUTO_INCREMENT,
    Name VARCHAR(100) NOT NULL,
    Password VARCHAR(255) NOT NULL,
    fighter_high_score INT UNSIGNED NOT NULL DEFAULT 0,
    memory_high_score INT UNSIGNED NOT NULL DEFAULT 0,
    snake_high_score INT UNSIGNED NOT NULL DEFAULT 0,
    PRIMARY KEY (id),
    UNIQUE KEY uq_users_name (Name)
)

-- (Opcionális) Minta adatok
-- INSERT INTO users (Name, Password, fighter_high_score, memory_high_score, snake_high_score)
-- VALUES
-- ('Player1', 'Password1', 1200, 800, 500),
-- ('Player2', 'Password2', 300, 1500, 200);
