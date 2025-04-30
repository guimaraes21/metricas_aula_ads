# Configuração do Banco de Dados PostgreSQL

Este README fornece o contexto sobre a configuração do banco de dados PostgreSQL para o projeto de observabilidade, que utiliza o esquema e os dados do banco de dados bancoddl.

## Visão Geral

O banco de dados PostgreSQL é configurado usando um contêiner Docker. O banco de dados é inicializado com o conjunto de dados bancoddl, que inclui várias tabelas e dados de exemplo comumente usados para testes e demonstrações.

## Dockerfile

O `Dockerfile` neste diretório contém as instruções para construir uma imagem Docker para o banco de dados PostgreSQL. Ele configura o ambiente PostgreSQL e inicializa o banco de dados usando o arquivo `bancoddl.sql`.

## Construindo a Imagem Docker

Para construir a imagem Docker para o banco de dados PostgreSQL, navegue até o diretório `db` e execute o seguinte comando:

```bash
docker build -t bancoddl-db .
```

## Executando o Contêiner PostgreSQL

Após construir a imagem, você pode executar o contêiner PostgreSQL usando o seguinte comando:

```bash
docker run --name bancoddl-db -e POSTGRES_PASSWORD=minhasenhasecreta -d -p 2025:5432 bancoddl-db
```

Substitua `minhasenhasecreta` por uma senha segura de sua escolha.

## Acessando o Banco de Dados

Depois que o contêiner estiver em execução, você pode acessar o banco de dados PostgreSQL usando qualquer cliente PostgreSQL. Os parâmetros de conexão padrão são:

- Host: `localhost`
- Porta: `5432`
- Banco de Dados: `postgres`
- Usuário: `postgres`
- Senha: `minhasenhasecreta` (ou a senha que você definiu)

## Inicialização

O arquivo `bancoddl.sql` contém o dump SQL para o banco de dados bancoddl. Ele inclui o esquema e os dados necessários para popular o banco de dados PostgreSQL. A inicialização do banco de dados com este arquivo SQL é feita automaticamente quando o contêiner é iniciado.

## Conclusão

Esta configuração permite que você implante rapidamente um banco de dados PostgreSQL com o conjunto de dados bancoddl para fins de teste e desenvolvimento. Para integração adicional com ferramentas de monitoramento e observabilidade, consulte os outros componentes do projeto de observabilidade.