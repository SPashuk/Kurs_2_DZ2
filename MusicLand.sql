-- Создаем таблицу Жанр(genre)+
CREATE TABLE IF NOT EXISTS genre(
	genre_name VARCHAR(40) UNIQUE NOT null,
	id SERIAL PRIMARY key);

-- Создаем таблицу Исполнителей(musician)
CREATE TABLE IF NOT EXISTS musician(
    first_name VARCHAR(20), 
    last_name VARCHAR(20) NOT NULL,
    nick_name VARCHAR(40),
    id SERIAL PRIMARY KEY);
   
-- Создаем таблицу связей Исполинтелей и Жанров (musician_genre)
CREATE TABLE IF NOT EXISTS musician_genre(
    musician_id INTEGER REFERENCES musician(id), 
    genre_id INTEGER REFERENCES genre(id),
    mus_gen_id SERIAL PRIMARY KEY);
   
-- Создаем таблицу Колекций(collections)
CREATE TABLE IF NOT EXISTS collections(
    collection_name VARCHAR(60) unique NOT NULL, 
    collection_year NUMERIC(4, 0) NOT NULL,
    id SERIAL PRIMARY KEY);
   
-- Создаем таблицу Альбомы(albums)
CREATE TABLE IF NOT EXISTS albums(
    album_name VARCHAR(60) NOT NULL,
    album_year NUMERIC(4, 0) NOT null,
    id SERIAL PRIMARY KEY);
   
-- Создаем таблицу связей Исполнители и Альбомы (musician_album)
CREATE TABLE IF NOT EXISTS musician_album(
    musician_id INTEGER REFERENCES musician(id), 
    albums_id INTEGER REFERENCES albums(id),
    id SERIAL PRIMARY KEY);
   
-- Создаем таблицу Песен(song)
CREATE TABLE IF NOT EXISTS song(
	id SERIAL PRIMARY key,
	track_num NUMERIC(3, 0) NOT NULL,
    track_name VARCHAR(60) NOT NULL,
    albums_id INTEGER REFERENCES albums(id),
    track_time TIME NOT null);
   
-- Создаем таблицу Сборники(collection_track)
CREATE TABLE IF NOT EXISTS collection_track(
    id SERIAL PRIMARY key,
	collect_id INTEGER REFERENCES collections(id), 
    track_id INTEGER REFERENCES song(id));