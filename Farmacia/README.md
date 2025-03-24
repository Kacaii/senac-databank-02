# FarmaciaDB

```mermaid
erDiagram
 plano_saude ||--|| cliente : references

 cliente {
  VARCHAR(14) cpf
  VARCHAR(45) nome
  VARCHAR(1) sexo
  VARCHAR(45) email
  VARCHAR(15) telefone
  DATE data_nasc
 }

 plano_saude {
  VARCHAR(14) cliente_cpf
  VARCHAR(45) numero
  VARCHAR(45) nome
 }
```
