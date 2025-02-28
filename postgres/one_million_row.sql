create table public.test
(
    id   serial,
    name varchar(255) not null
);


INSERT INTO auth.test (id, name) SELECT *,md5(random()::text) FROM generate_series(1, 1000000);
