CREATE TABLE pay (
    id_invoice integer not null,
    amount numeric,
    state integer,
    primary key (id_invoice)
);