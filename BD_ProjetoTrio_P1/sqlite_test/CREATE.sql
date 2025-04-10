CREATE TABLE IF NOT EXISTS "Produto" (
    "id" INTEGER NOT NULL UNIQUE,
    "nome" TEXT NOT NULL,
    "descricao" TEXT,
    "preco" REAL NOT NULL,
    "tamanho" TEXT NOT NULL,
    "cor" TEXT,
    "marca" TEXT,
    "id_fornecedor" INTEGER,
    "id_categoria" INTEGER,
    PRIMARY KEY ("id"),
    FOREIGN KEY ("id_fornecedor") REFERENCES "Fornecedor" ("id")
    ON UPDATE CASCADE ON DELETE SET NULL,
    FOREIGN KEY ("id_categoria") REFERENCES "Categoria" ("id")
    ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS "Fornecedor" (
    "id" INTEGER NOT NULL UNIQUE,
    "nome" TEXT NOT NULL,
    "endereco" TEXT,
    "telefone" TEXT,
    "email" TEXT UNIQUE,
    PRIMARY KEY ("id")
);

CREATE TABLE IF NOT EXISTS "Categoria" (
    "id" INTEGER NOT NULL UNIQUE,
    "nome" TEXT NOT NULL,
    PRIMARY KEY ("id")
);

CREATE TABLE IF NOT EXISTS "Estoque" (
    "id" INTEGER NOT NULL UNIQUE,
    "quantidade" INTEGER NOT NULL,
    "data_entrada" DATE NOT NULL,
    "data_saida" DATE NOT NULL,
    "id_produto" INTEGER,
    PRIMARY KEY ("id"),
    FOREIGN KEY ("id_produto") REFERENCES "Produto" ("id")
    ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS "Venda" (
    "id" INTEGER NOT NULL UNIQUE,
    "data_venda" DATE NOT NULL,
    "id_cliente" INTEGER NOT NULL,
    "id_forma_pagamento" INTEGER NOT NULL,
    "status_entrega" BOOLEAN NOT NULL,
    "id_funcionario" INTEGER NOT NULL,
    PRIMARY KEY ("id"),
    FOREIGN KEY ("id_forma_pagamento") REFERENCES "Forma_Pagamento" ("id")
    ON UPDATE CASCADE ON DELETE SET NULL,
    FOREIGN KEY ("id_cliente") REFERENCES "Cliente" ("id")
    ON UPDATE CASCADE ON DELETE NO ACTION,
    FOREIGN KEY ("id_funcionario") REFERENCES "Funcionario" ("id")
    ON UPDATE CASCADE ON DELETE NO ACTION
);

CREATE TABLE IF NOT EXISTS "Forma_Pagamento" (
    "id" INTEGER NOT NULL UNIQUE,
    "nome" TEXT NOT NULL,
    PRIMARY KEY ("id")
);

CREATE TABLE IF NOT EXISTS "Cliente" (
    "id" INTEGER NOT NULL UNIQUE,
    "nome" TEXT NOT NULL,
    "endereco" TEXT,
    "telefone" INTEGER UNIQUE,
    "email" TEXT UNIQUE,
    PRIMARY KEY ("id")
);

CREATE TABLE IF NOT EXISTS "Funcionario" (
    "id" INTEGER NOT NULL UNIQUE,
    "nome" TEXT NOT NULL,
    "cargo" TEXT NOT NULL,
    "telefone" TEXT UNIQUE,
    PRIMARY KEY ("id")
);

CREATE TABLE IF NOT EXISTS "Promocao" (
    "id" INTEGER NOT NULL UNIQUE,
    "nome" TEXT NOT NULL,
    "descricao" TEXT,
    "valor_desconto" REAL NOT NULL,
    "ativo" BOOLEAN NOT NULL,
    "data_inicio" DATE NOT NULL,
    "data_fim" DATE,
    PRIMARY KEY ("id")
);

CREATE TABLE IF NOT EXISTS "Item_Venda" (
    "id" INTEGER NOT NULL UNIQUE,
    "id_venda" INTEGER NOT NULL,
    "id_produto" INTEGER NOT NULL,
    "quantidade" INTEGER NOT NULL,
    "preco_unitario" REAL NOT NULL,
    "id_promocao" INTEGER,
    PRIMARY KEY ("id"),
    FOREIGN KEY ("id_venda") REFERENCES "Venda" ("id")
    ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY ("id_promocao") REFERENCES "Promocao" ("id")
    ON UPDATE CASCADE ON DELETE SET NULL,
    FOREIGN KEY ("id_produto") REFERENCES "Produto" ("id")
    ON UPDATE CASCADE ON DELETE SET NULL
);

CREATE TABLE IF NOT EXISTS "Promocao_Produto" (
    "id" INTEGER NOT NULL UNIQUE,
    "id_produto" INTEGER NOT NULL,
    "id_promocao" INTEGER NOT NULL,
    PRIMARY KEY ("id"),
    FOREIGN KEY ("id_produto") REFERENCES "Produto" ("id")
    ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY ("id_promocao") REFERENCES "Promocao" ("id")
    ON UPDATE CASCADE ON DELETE CASCADE
);
