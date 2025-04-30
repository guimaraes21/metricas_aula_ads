CREATE DATABASE sistema_loja;

-- Tabela de usuários
CREATE TABLE usuarios (
    usuario_id SERIAL PRIMARY KEY,
    nome_completo VARCHAR(100) NOT NULL,
    contato_email VARCHAR(100),
    contato_telefone VARCHAR(20),
    data_criacao TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Tabela de mercadorias
CREATE TABLE mercadorias (
    mercadoria_id SERIAL PRIMARY KEY,
    descricao VARCHAR(100) NOT NULL,
    valor NUMERIC(10,2) NOT NULL,
    quantidade_disponivel INT NOT NULL,
    criado_em TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Tabela de vendas
CREATE TABLE vendas (
    venda_id SERIAL PRIMARY KEY,
    usuario_id INT REFERENCES usuarios(usuario_id),
    data_venda DATE DEFAULT CURRENT_DATE,
    valor_total NUMERIC(10,2),
    situacao VARCHAR(20) DEFAULT 'PENDENTE'
);

-- Tabela de detalhes da venda
CREATE TABLE detalhes_venda (
    detalhe_id SERIAL PRIMARY KEY,
    venda_id INT REFERENCES vendas(venda_id),
    mercadoria_id INT REFERENCES mercadorias(mercadoria_id),
    qtd INT NOT NULL,
    valor_unitario NUMERIC(10,2) NOT NULL
);

-- Índices
CREATE INDEX idx_vendas_usuario ON vendas(usuario_id);
CREATE INDEX idx_detalhes_venda_venda ON detalhes_venda(venda_id);
CREATE INDEX idx_detalhes_venda_mercadoria ON detalhes_venda(mercadoria_id);
