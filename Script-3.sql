--#Задание 3
--1. Количество исполнителей в каждом жанре.++
select genre_id, (
	select genre_name 
	from genre 
	where id=genre_id) as g1,
		COUNT(mus_gen_id) 
as musician_id 
from musician_genre
group by genre_id order by genre_id;--desc;

--1. Количество исполнителей в каждом жанре. вариант 2++
select genre_name, count(musician_id) 
from genre g 
left join musician_genre mg on g.id = mg.genre_id 
group by genre_name/* Группируем по айди жанров - не прокатило, только по имени */
order by genre_name;/* Сортируем по имени */

--2. Количество треков, вошедших в альбомы 2019–2020 годов.++
select count(track_name) from albums a
join song s on a.id = s.albums_id
where album_year between 2019 and 2020;

--3. Средняя продолжительность треков по каждому альбому.++
select album_name, avg(track_time) as mean from albums a 
left join song s on a.id = s.albums_id
group by album_name
order by mean;

--4. Все исполнители, которые не выпустили альбомы в 2020 году.++
select nick_name, album_year from musician m 
join musician_album ma on m.id = ma.albums_id
join albums a on ma.albums_id = a.id
where album_year  != 2020;--<> 2020;/*не равен 2020*/

--4. Все исполнители, которые не выпустили альбомы в 2020 году. вариант2
SELECT nick_name /* Получаем имена исполнителей */
from musician  /* Из таблицы исполнителей */
where nick_name NOT IN ( /* Где имя исполнителя не входит в вложенную выборку */
    select nick_name /* Получаем имена исполнителей */
    from musician m /* Из таблицы исполнителей */
    join musician_album ma on m.id = ma.albums_id /* Объединяем с промежуточной таблицей */
    join albums a on ma.albums_id = a.id /* Объединяем с таблицей альбомов */
    where album_year = 2020 /* Где год альбома равен 2020 */
);

--5. Названия сборников, в которых присутствует конкретный исполнитель (выберите его сами).++
select distinct collection_name from collections c
join collection_track ct on c.id = ct.collect_id
join song s on ct.track_id = s.id
join musician_album ma on s.albums_id = ma.albums_id 
join musician m on ma.musician_id = m.id
where nick_name = 'А. Розенбаум'
order by collection_name;-- desc; -- 'А. Розенбаум';

--5. Названия сборников, в которых присутствует конкретный исполнитель (выберите его сами).+
select collection_name from collections c
where c.id in (select collect_id from collection_track ct 
join song s on ct.track_id = s.id
join musician_album ma on s.albums_id =ma.albums_id 
join musician m on ma.musician_id = m.id
where nick_name = 'А. Розенбаум');--'В. Цой'); --'А. Розенбаум';)