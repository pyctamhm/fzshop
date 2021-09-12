create table Category();

create table ProductType(
    id serial primary key,
    name varchar not null,
    slug varchar not null,
    has_variants boolean not null,
    is_digital boolean not null
);

create table Product(
    id serial primary key,
    name varchar not null,
    slug varchar not null unique,
    desctiption text,
    category integer references Categoryes on delete set null,
    default_variant integer references ProductVariants on delete set null,
    rating real,
);


create table ProductVariant(
    sku varchar unique,
    name varchar,
    product_id integer not null references Products on delete cascade,
);



create table ProductMedia(
    product integer not null references Products on delete cascade,
    image text not null,
    alt varchar(128),  
    external_url varchar not null,
);


create table VariantMedia(
    variant integer not null references PoductVariant on delete cascade,
    media integer not null references ProductMedia on delete cascade
);
