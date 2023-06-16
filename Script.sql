create table public.albums (
	id serial4 not null,
	album_name varchar(200) not null,
	"year" int4 null,
	constraint albums_check check ((year > 2000)),
	constraint albums_pkey primary key (id)
);

create table if not exists public.singers (
    id serial4 not null,
    singer_name varchar(200) not null,
    constraint singers_pkey primary key (id)
);

create table if not exists public.styles (
    id serial4 NOT NULL,
    style_name varchar(200) NOT NULL,
    CONSTRAINT styles_pkey PRIMARY KEY (id)
);

create table if not exists public.singers_albums (
    singer_id int4 NOT NULL,
    album_id int4 NOT NULL,
    CONSTRAINT singers_albums_pk PRIMARY KEY (singer_id, album_id),
    CONSTRAINT singers_albums_album_id_fkey FOREIGN KEY (album_id) REFERENCES public.albums(id),
    CONSTRAINT singers_albums_singer_id_fkey FOREIGN KEY (singer_id) REFERENCES public.singers(id)
);

create table if not exists public.songs (
    id serial4 NOT NULL,
    song_name varchar(200) NOT NULL,
    duration integer NULL,
    album_id int4 NULL,
    CONSTRAINT songs_pkey PRIMARY KEY (id),
    CONSTRAINT songs_fk FOREIGN KEY (album_id) REFERENCES public.albums(id)
);

create table if not exists public.styles_singers (
    style_id int4 NOT NULL,
    singer_id int4 NOT NULL,
    CONSTRAINT style_singers_pk PRIMARY KEY (style_id, singer_id),
    CONSTRAINT styles_singers_singer_id_fkey FOREIGN KEY (singer_id) REFERENCES public.singers(id),
    CONSTRAINT styles_singers_style_id_fkey FOREIGN KEY (style_id) REFERENCES public.styles(id)
);

create table if not exists public.colections (
    id serial4 not null,
    collection_name varchar(200) not null,
    "year" int4 null,
    song_id int4 null,
    constraint colections_pkey primary key (id),
    constraint colections_song_id_fkey foreign key (song_id) references public.songs(id)
);


create table if not exists public.songs_colections (
    song_id int4 NOT NULL,
    colection_id int4 NOT NULL,
    CONSTRAINT songs_colections_pk PRIMARY KEY (song_id, colection_id),
    CONSTRAINT songs_colections_collection_id_fkey FOREIGN KEY (colection_id) REFERENCES public.colections(id),
    CONSTRAINT songs_colections_song_id_fkey FOREIGN KEY (song_id) REFERENCES public.songs(id)
);
