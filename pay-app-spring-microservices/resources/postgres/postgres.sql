CREATE TABLE IF NOT EXISTS invoice (
    id_invoice integer GENERATED by default as IDENTITY PRIMARY KEY,
    amount numeric,
    state integer
)
