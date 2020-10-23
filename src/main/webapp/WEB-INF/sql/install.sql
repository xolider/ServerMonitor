create table users
(
    id int auto_increment,
    username varchar(255) not null,
    password varchar(255) not null,
    isAdmin bool not null DEFAULT false,
    constraint users_pk
        primary key (id)
);

create unique index users_username_uindex
    on users (username);

