CREATE TABLE public.albums (
  id serial4 NOT NULL,
  album_name VARCHAR(200) NOT NULL,
  "year" INT4 NULL,
  CONSTRAINT albums_check CHECK ((year > 1980)),
  CONSTRAINT albums_pkey PRIMARY KEY (id)
);

CREATE TABLE public.colections (
  id serial4 NOT NULL,
  collection_name VARCHAR(200) NOT NULL,
  "year" INT4 NULL,
  CONSTRAINT colections_check CHECK ((year > 1980)),
  CONSTRAINT colections_pkey PRIMARY KEY (id)
);

CREATE TABLE public.singers (
  id serial4 NOT NULL,
  singer_name VARCHAR(200) NOT NULL,
  CONSTRAINT singers_pkey PRIMARY KEY (id)
);

CREATE TABLE public.styles (
  id serial4 NOT NULL,
  style_name VARCHAR(200) NOT NULL,
  CONSTRAINT styles_pkey PRIMARY KEY (id),
  CONSTRAINT styles_un UNIQUE (style_name)
);

CREATE TABLE public.singers_albums (
  singer_id INT4 NOT NULL,
  album_id INT4 NOT NULL,
  CONSTRAINT singers_albums_pk PRIMARY KEY (singer_id, album_id),
  CONSTRAINT singers_albums_album_id_fkey FOREIGN KEY (album_id) REFERENCES public.albums (id),
  CONSTRAINT singers_albums_singer_id_fkey FOREIGN KEY (singer_id) REFERENCES public.singers (id)
);

CREATE TABLE public.songs (
  id serial4 NOT NULL,
  song_name VARCHAR(200) NOT NULL,
  duration INT4 NULL,
  album_id INT4 NULL,
  CONSTRAINT songs_pkey PRIMARY KEY (id),
  CONSTRAINT songs_fk FOREIGN KEY (album_id) REFERENCES public.albums (id)
);

CREATE TABLE public.songs_colections (
  song_id INT4 NOT NULL,
  colection_id INT4 NOT NULL,
  CONSTRAINT songs_colections_pk PRIMARY KEY (song_id, colection_id),
  CONSTRAINT songs_colections_collection_id_fkey FOREIGN KEY (colection_id) REFERENCES public.colections (id),
  CONSTRAINT songs_colections_song_id_fkey FOREIGN KEY (song_id) REFERENCES public.songs (id)
);

CREATE TABLE public.styles_singers (
  style_id INT4 NOT NULL,
  singer_id INT4 NOT NULL,
  CONSTRAINT style_singers_pk PRIMARY KEY (style_id, singer_id),
  CONSTRAINT styles_singers_singer_id_fkey FOREIGN KEY (singer_id) REFERENCES public.singers (id),
  CONSTRAINT styles_singers_style_id_fkey FOREIGN KEY (style_id) REFERENCES public.styles (id)
);


INSERT INTO public.albums (album_name,
"year")
  VALUES ('Герой асфальта', 1987),
  ('Химера', 2001),
  ('Проклятье морей', 2018),
  ('Время X', 2012),
  ('Полюса', 2018),
  ('Сделай громче!', 2010),
  ('Wishmaster', 2000),
  ('Once', 2004),
  ('Imaginaerum', 2011);

INSERT INTO public.colections (collection_name,
"year")
  VALUES ('Коллекция Louna_2', 2020),
  ('Коллекция Nightwish_1', 2012),
  ('Коллекция Nightwish_2', 2013),
  ('Коллекция Ария_1', 2019),
  ('Коллекция Ария_2', 2020),
  ('Коллекция Louna_1', 2019);

INSERT INTO public.singers (singer_name)
  VALUES ('Ария'),
  ('Nigthwish'),
  ('Louna');

INSERT INTO public.singers_albums (singer_id,
album_id)
  VALUES (1, 1),
  (1, 2),
  (1, 3),
  (2, 4),
  (2, 5),
  (2, 6),
  (3, 7),
  (3, 8),
  (3, 9);

INSERT INTO public.songs (song_name,
duration,
album_id)
  VALUES ('Мёртвая зона', 403, 1),
  ('Улица роз', 357, 1),
  ('На службе силы зла', 431, 1),
  ('Ворон', 345, 2),
  ('Небо тебя найдёт', 631, 2),
  ('Осколок льда', 626, 2),
  ('Пусть будет так', 315, 3),
  ('Убить дракона', 345, 3),
  ('Гонка за славой', 296, 3),
  ('Все как один', 162, 4),
  ('Ночь, дорога и рок', 193, 4),
  ('Время Х', 226, 4),
  ('Огня', 239, 5),
  ('Шум', 229, 5),
  ('Так', 238, 5),
  ('Свободное падение', 257, 6),
  ('Пока не поздно', 183, 6),
  ('Сожженая заживо', 286, 6),
  ('Deep Silent Complete', 238, 7),
  ('Wishmaster', 265, 7),
  ('Come Cover Me', 275, 7),
  ('Dark Chest of Wonders', 269, 8),
  ('Planet Hell', 279, 8),
  ('Higher Than Hope', 338, 8),
  ('Arabesque', 172, 9),
  ('Last Ride of the Day', 271, 9),
  ('Slow, Love, Slow', 350, 9);

INSERT INTO public.songs_colections (song_id, colection_id)
  VALUES (1, 1),
  (4, 1),
  (7, 1),
  (2, 2),
  (5, 2),
  (8, 2),
  (10, 3),
  (13, 3),
  (16, 3),
  (11, 4),
  (14, 4),
  (17, 4),
  (19, 5),
  (22, 5),
  (25, 5),
  (18, 6),
  (23, 6),
  (26, 6);

INSERT INTO public.styles (style_name)
  VALUES ('Фолк-музыка'),
  ('Кантри'),
  ('Латиноамериканская музыка'),
  ('Блюз'),
  ('Ритм-н-блюз'),
  ('Джаз'),
  ('Шансон'),
  ('Романс'),
  ('Авторская песня'),
  ('Электронная музыка'),
  ('Рок'),
  ('Хип-хоп'),
  ('Регги'),
  ('Фанк'),
  ('Новая волна'),
  ('Соул'),
  ('Диско'),
  ('Поп-музыка'),
  ('Hard-rock');

INSERT INTO public.styles_singers (style_id, singer_id)
  VALUES (11, 1),
  (11, 2),
  (19, 3);