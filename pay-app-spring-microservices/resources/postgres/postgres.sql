CREATE TABLE IF NOT EXISTS invoice (
    id_invoice integer not null,
    amount numeric,
    state integer,
    primary key (id_invoice)
);
