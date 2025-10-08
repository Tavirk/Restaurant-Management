create table users (
                       id bigint primary key auto_increment,
                       username varchar(64) unique not null,
                       password varchar(255) not null,
                       enabled boolean default true
);

create table user_roles (
                            id bigint primary key auto_increment,
                            user_id bigint not null,
                            role varchar(32) not null,
                            foreign key (user_id) references users(id)
);

create table restaurant_tables (
                                   id bigint primary key auto_increment,
                                   number int not null,
                                   capacity int not null,
                                   status varchar(16) default 'FREE'
);

create table categories (
                            id bigint primary key auto_increment,
                            name varchar(64) not null
);

create table menu_items (
                            id bigint primary key auto_increment,
                            name varchar(128) not null,
                            price decimal(10,2) not null,
                            category_id bigint,
                            available boolean default true,
                            foreign key (category_id) references categories(id)
);

create table orders (
                        id bigint primary key auto_increment,
                        table_id bigint not null,
                        status varchar(16) default 'PLACED',
                        created_at timestamp default current_timestamp,
                        foreign key (table_id) references restaurant_tables(id)
);

create table order_items (
                             id bigint primary key auto_increment,
                             order_id bigint not null,
                             menu_item_id bigint not null,
                             qty int not null,
                             price decimal(10,2) not null,
                             foreign key (order_id) references orders(id),
                             foreign key (menu_item_id) references menu_items(id)
);

create table reservations (
                              id bigint primary key auto_increment,
                              name varchar(128) not null,
                              phone varchar(24),
                              for_time timestamp not null,
                              party_size int not null,
                              status varchar(16) default 'PENDING'
);
