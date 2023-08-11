--Задание 2
-- Написать SELECT-запросы, которые выведут информацию согласно инструкциям ниже.
-- Внимание: результаты запросов не должны быть пустыми, учтите это при заполнении таблиц.
-- 1. Название и продолжительность самого длительного трека.
SELECT track_name, track_time 
FROM song
WHERE track_time = (SELECT MAX(track_time) FROM song);

-- 2. Название треков, продолжительность которых не менее 3,5 минут.
SELECT track_name, track_time FROM song
WHERE track_time > '3:30:00'
ORDER BY track_time DESC;

-- 3. Названия сборников, вышедших в период с 2018 по 2020 год включительно.
select collection_name from collections
where collection_year between 2018 and 2020;

-- 4. Исполнители, чьё имя состоит из одного слова.
select first_name, last_name from musician
where nick_name not like '% %';

-- 5. Название треков, которые содержат слово «мой» или «my».
select track_name from song
where track_name like '%мой%' OR track_name like '%my%';