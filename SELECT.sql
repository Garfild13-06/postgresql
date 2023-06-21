-- Задание 2
-- Название и продолжительность самого длительного трека.
SELECT
  s.song_name,
  s.duration
FROM songs s
WHERE s.duration = (SELECT
    MAX(s.duration)
  FROM songs s);

-- Название треков, продолжительность которых не менее 3,5 минут.
SELECT
  s.song_name,
  s.duration
FROM songs s
WHERE s.duration > (60 * 3.5);

-- Названия сборников, вышедших в период с 2018 по 2020 год включительно.
SELECT
  *
FROM colections c
WHERE c."year" BETWEEN 2018 AND 2020;

-- Исполнители, чьё имя состоит из одного слова. Ищем названия, в которых нет пробелов и, соответственно, имеется только одно слово
SELECT
  *
FROM singers s
WHERE strpos(s.singer_name, ' ') = 0;

-- Название треков, которые содержат слово «мой» или «my».
SELECT
  *
FROM songs s
WHERE s.song_name ILIKE '%my%'
OR s.song_name ILIKE '%мой%';


-- Задание 3
-- Количество исполнителей в каждом жанре. На основе таблицы-связки.
SELECT
  s1.style_name,
  COUNT(ss.singer_id) AS "Исполнителей в жанре"
FROM styles_singers ss
  LEFT JOIN styles s1
    ON ss.style_id = s1.id
GROUP BY s1.style_name;

-- Количество треков, вошедших в альбомы 2019–2020 годов.
SELECT
  a.album_name,
  COUNT(s.song_name) AS "Кол-во треков"
FROM albums a
  LEFT JOIN songs s
    ON a.id = s.album_id
WHERE a.year BETWEEN 2019 AND 2020
GROUP BY a.album_name;

-- Средняя продолжительность треков по каждому альбому.
SELECT
  a.album_name,
  round(AVG(s.duration), 2) AS "Средняя продолжительность в сек"
FROM albums a
  LEFT JOIN songs s
    ON a.id = s.album_id
GROUP BY a.album_name;

-- Все исполнители, которые не выпустили альбомы в 2020 году.
SELECT
DISTINCT
  (s.singer_name)
FROM singers_albums sa
  LEFT JOIN singers s
    ON sa.singer_id = s.id
  LEFT JOIN albums a
    ON sa.album_id = a.id
WHERE a."year" <> 2020;

-- Названия сборников, в которых присутствует конкретный исполнитель (выберите его сами).
SELECT
DISTINCT
  (c.collection_name),
  s2.singer_name
FROM songs_colections sc
  LEFT JOIN colections c
    ON sc.colection_id = c.id
  LEFT JOIN songs s
    ON sc.song_id = s.id
  LEFT JOIN albums a
    ON s.album_id = a.id
  LEFT JOIN singers_albums sa
    ON a.id = sa.album_id
  LEFT JOIN singers s2
    ON sa.singer_id = s2.id
WHERE s2.singer_name = 'Ария'


-- Задание 4(необязательное)
-- Наименования треков, которые не входят в сборники.
SELECT
  *
FROM songs s
  LEFT JOIN songs_colections sc
    ON s.id = sc.song_id
WHERE sc.song_id IS NULL;

-- Исполнитель или исполнители, написавшие самый короткий по продолжительности трек, — теоретически таких треков может быть несколько.
SELECT
  s.song_name,
  s.duration,
  s2.singer_name
FROM songs s
  LEFT JOIN albums a
    ON s.album_id = a.id
  LEFT JOIN singers_albums sa
    ON a.id = sa.album_id
  LEFT JOIN singers s2
    ON sa.singer_id = s2.id
ORDER BY duration LIMIT 3