CREATE TABLE IF NOT EXISTS "cliente" (
    "cpf" VARCHAR NOT NULL UNIQUE,
    "nome" VARCHAR NOT NULL,
    "sexo" VARCHAR NOT NULL,
    "email" VARCHAR,
    "telefone" VARCHAR NOT NULL,
    "data_nasc" DATE,
    PRIMARY KEY ("cpf")
);

CREATE TABLE IF NOT EXISTS "plano_saude" (
    "cliente_cpf" VARCHAR NOT NULL UNIQUE,
    "numero" VARCHAR NOT NULL,
    "nome" VARCHAR NOT NULL,
    PRIMARY KEY ("cliente_cpf"),
    FOREIGN KEY ("cliente_cpf") REFERENCES "cliente" ("cpf")
    ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE INDEX IF NOT EXISTS "plano_saude_index_0"
ON "plano_saude" ("cliente_cpf");
