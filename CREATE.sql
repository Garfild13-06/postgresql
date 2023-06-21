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