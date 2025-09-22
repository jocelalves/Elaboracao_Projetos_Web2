
create database ArrumaJa;
use ArrumaJa;
drop database ArrumaJa;
-- Criação do banco de dados


-- ==============================
-- TABELA MARIDO_ALUGUEL
-- ==============================
CREATE TABLE Marido_Aluguel (
    idMarido_Aluguel INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
    servicos VARCHAR(45) NOT NULL,
    nome VARCHAR(45) NOT NULL,
    cpf VARCHAR(11) UNIQUE NOT NULL,
    senha VARCHAR(45) NOT NULL,
    telefone VARCHAR(20),
    email VARCHAR(45) UNIQUE
);


-- ==============================
-- TABELA CLIENTE
-- ==============================
CREATE TABLE cliente (
    idCliente INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
    nome VARCHAR(150) NOT NULL,
    cpf VARCHAR(11) UNIQUE NOT NULL,
    telefone VARCHAR(20),
    email VARCHAR(150) UNIQUE,
    senha VARCHAR(12) NOT NULL
);

-- ==============================
-- TABELA ENDERECO
-- ==============================
CREATE TABLE endereco (
    idEndereco INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
    cep VARCHAR(10)NOT NULL,
    cidade VARCHAR(45)NOT NULL,
    estado VARCHAR(45)NOT NULL,
    numero VARCHAR(10)NOT NULL,
    complemento VARCHAR(45),
    logradouro VARCHAR(100)NOT NULL,
    bairro VARCHAR(45) NOT NULL
);

-- ==============================
-- RELAÇÃO CLIENTE x ENDERECO
-- ==============================
CREATE TABLE cliente_has_endereco (
    Cliente_idCliente INT,
    Endereco_idEndereco INT,
    PRIMARY KEY (Cliente_idCliente, Endereco_idEndereco),
    FOREIGN KEY (Cliente_idCliente) REFERENCES cliente(idCliente) ON DELETE CASCADE,
    FOREIGN KEY (Endereco_idEndereco) REFERENCES endereco(idEndereco) ON DELETE CASCADE
);

-- ==============================
-- TABELA FRETE
-- ==============================
CREATE TABLE frete (
    idFrete INT AUTO_INCREMENT PRIMARY KEY NOT NULL NOT NULL,
    bairro VARCHAR(45)NOT NULL,
    valor DOUBLE NOT NULL,
    transportadora VARCHAR(45)
);

-- ==============================
-- TABELA CUPOM
-- ==============================
CREATE TABLE cupom (
    idCupom INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
    nome VARCHAR(45),
    valor DOUBLE 
);

-- ==============================
-- TABELA FORMAS DE PAGAMENTO
-- ==============================
CREATE TABLE formas_pagamento (
    idFormas_Pagamento INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
    nome VARCHAR(45)
);

-- ==============================
-- TABELA CATEGORIAS DE PRODUTOS
-- ==============================
CREATE TABLE categorias_produtos (
    idCategorias_Produtos INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
    nome VARCHAR(45) NOT NULL,
    desconto DOUBLE NOT NULL
);

-- ==============================
-- TABELA SERVICOS
-- ==============================
CREATE TABLE servicos (
    idServicos INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
    nome VARCHAR(45) NOT NULL,
    descricao TEXT NOT NULL,
    quantidade INT ,
    preco DOUBLE NOT NULL,
    preco_promocional DOUBLE,
    Formas_Pagamento_idFormas_Pagamento INT NOT NULL,
    Categorias_Produtos_idCategorias_Produtos INT NOT NULL,
    Frete_idFrete INT NOT NULL,
    Cupom_idCupom INT NOT NULL,
    FOREIGN KEY (Formas_Pagamento_idFormas_Pagamento) REFERENCES formas_pagamento(idFormas_Pagamento),
    FOREIGN KEY (Categorias_Produtos_idCategorias_Produtos) REFERENCES categorias_produtos(idCategorias_Produtos),
    FOREIGN KEY (Frete_idFrete) REFERENCES frete(idFrete),
    FOREIGN KEY (Cupom_idCupom) REFERENCES cupom(idCupom)
);

-- ==============================
-- RELAÇÃO SERVICOS x CLIENTE
-- ==============================
CREATE TABLE servicos_has_cliente (
    Servicos_idServicos INT,
    Cliente_idCliente INT,
    PRIMARY KEY (Servicos_idServicos, Cliente_idCliente),
    FOREIGN KEY (Servicos_idServicos) REFERENCES servicos(idServicos) ON DELETE CASCADE,
    FOREIGN KEY (Cliente_idCliente) REFERENCES cliente(idCliente) ON DELETE CASCADE
);

-- ==============================
-- TABELA IMAGEM_PRODUTOS
-- ==============================
CREATE TABLE imagem_produtos (
    idImagem_Produtos INT AUTO_INCREMENT PRIMARY KEY NOT NULL ,
    foto LONGBLOB NOT NULL,
    descricao VARCHAR(45) NOT NULL,
    Servicos_idServicos INT ,
    FOREIGN KEY (Servicos_idServicos) REFERENCES servicos(idServicos) ON DELETE CASCADE
);

-- ==============================
-- TABELA BANNERS
-- ==============================
CREATE TABLE banners (
    idBanners INT AUTO_INCREMENT PRIMARY KEY,
    imagem LONGBLOB NOT NULL,
    data_validade DATE NOT NULL,
    descricao VARCHAR(45)
);

-- ==============================
-- TABELA HORARIOS_SERVICOS
-- ==============================
CREATE TABLE horarios_servicos (
    idHorarios_Servicos INT AUTO_INCREMENT PRIMARY KEY,
    hora DATETIME,
    forma_pagamento VARCHAR(45),
    valor_frete DOUBLE,
    valor_servico DOUBLE,
    valor_total DOUBLE,
    data_entrega DATE,
    situacao VARCHAR(45),
    cod_pix VARCHAR(45),
    cod_barras VARCHAR(45),
    valor_total_desconto DOUBLE
);

-- ==============================
-- RELAÇÃO SERVICOS x HORARIOS_SERVICOS
-- ==============================
CREATE TABLE servicos_has_horarios_servicos (
    Servicos_idServicos INT,
    Horarios_Servicos_idHorarios_Servicos INT,
    PRIMARY KEY (Servicos_idServicos, Horarios_Servicos_idHorarios_Servicos),
    FOREIGN KEY (Servicos_idServicos) REFERENCES servicos(idServicos) ON DELETE CASCADE,
    FOREIGN KEY (Horarios_Servicos_idHorarios_Servicos) REFERENCES horarios_servicos(idHorarios_Servicos) ON DELETE CASCADE
);

-- ==============================
-- RELAÇÃO MARIDO_ALUGUEL x SERVIÇOS
-- ==============================
CREATE TABLE marido_aluguel_has_servicos (
    Marido_Aluguel_idMarido_Aluguel INT,
    Servicos_idServicos INT,
    PRIMARY KEY (Marido_Aluguel_idMarido_Aluguel, Servicos_idServicos),
    FOREIGN KEY (Servicos_idServicos) REFERENCES servicos(idServicos) ON DELETE CASCADE
);


/*alterar comando para alterar o cpf do tipo int para varchar */
alter table cliente modify cpf varchar(11);
-- " "  entre parenteses para varchar

-- comando para excluir um registro na tabela 
/* delete from nomeTabela where id=1;*/

INSERT INTO Marido_Aluguel (servicos, nome, cpf, senha, telefone, email) VALUES
('Instalação de TV', 'Pedro Almeida', '12345678901', 'senha123', '11988887777', 'pedro.almeida@email.com'),
('Montagem de Móveis', 'Lucas Pereira', '98765432100', 'senha456', '21999998888', 'lucas.pereira@email.com'),
('Serviço Elétrico', 'Rafael Costa', '45678912300', 'senha789', '31977776666', 'rafael.costa@email.com'),
('Serviço Hidráulico', 'João Nunes', '78912345600', 'senha321', '41966665555', 'joao.nunes@email.com'),
('Pintura Residencial', 'Carlos Oliveira', '32165498700', 'senha654', '51955554444', 'carlos.oliveira@email.com');



INSERT INTO cliente (nome, cpf, telefone, email, senha) VALUES
('João Silva', '12345678901', '11987654321', 'joao.silva@email.com', 'senha123'),
('Maria Oliveira', '98765432100', '21987654321', 'maria.oliveira@email.com', 'senha456'),
('Carlos Santos', '45678912300', '31987654321', 'carlos.santos@email.com', 'senha789'),
('Ana Costa', '78912345600', '41987654321', 'ana.costa@email.com', 'senha321'),
('Fernanda Lima', '32165498700', '51987654321', 'fernanda.lima@email.com', 'senha654');


INSERT INTO endereco (cep, cidade, estado, numero, complemento, logradouro, bairro) VALUES
('01001-000', 'São Paulo', 'SP', '123', 'Apto 12', 'Av. Paulista', 'Bela Vista'),
('20040-020', 'Rio de Janeiro', 'RJ', '456', NULL, 'Rua da Quitanda', 'Centro'),
('30130-000', 'Belo Horizonte', 'MG', '789', 'Casa', 'Av. Afonso Pena', 'Centro'),
('40015-170', 'Salvador', 'BA', '321', 'Bloco B', 'Rua Chile', 'Comércio'),
('80010-000', 'Curitiba', 'PR', '654', NULL, 'Rua XV de Novembro', 'Centro');


INSERT INTO cliente_has_endereco (Cliente_idCliente, Endereco_idEndereco) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5);


INSERT INTO frete (bairro, valor, transportadora) VALUES
('Bela Vista', 25.00, 'Correios'),
('Centro', 20.00, 'Loggi'),
('Comércio', 30.00, 'JadLog'),
('Centro', 15.00, 'Sequoia'),
('Água Verde', 22.00, 'Correios');

INSERT INTO cupom (nome, valor) VALUES
('DESCONTO10', 10.00),
('FRETEGRATIS', 25.00),
('PROMO15', 15.00);


INSERT INTO formas_pagamento (nome) VALUES
('Cartão de Crédito'),
('Pix'),
('Dinheiro'),
('Boleto Bancário');

INSERT INTO categorias_produtos (nome, desconto) VALUES
('Instalações', 0.05),
('Montagem', 0.10),
('Elétrica', 0.08),
('Hidráulica', 0.07),
('Pintura', 0.12);


INSERT INTO servicos 
(nome, descricao, quantidade, preco, preco_promocional, 
 Formas_Pagamento_idFormas_Pagamento, Categorias_Produtos_idCategorias_Produtos, 
 Frete_idFrete, Cupom_idCupom) 
VALUES
('Instalação de TV', 
 'Montagem e instalação de TV em suporte de parede, incluindo fixação e teste de funcionamento.', 
 10, 150.00, 120.00, 
 1, 1, 1, 1),

('Montagem de Móveis', 
 'Montagem de guarda-roupa, estante, mesa ou cama, conforme manual do fabricante.', 
 15, 200.00, 180.00, 
 2, 2, 2, 2),

('Serviço Elétrico', 
 'Troca de tomadas, interruptores, instalação de chuveiro elétrico ou luminárias.', 
 20, 100.00, 90.00, 
 1, 3, 3, 3),

('Serviço Hidráulico', 
 'Conserto de vazamentos, troca de torneiras, sifões e reparos básicos de encanamento.', 
 12, 180.00, 150.00, 
 3, 4, 4, 1),

('Pintura Residencial', 
 'Pintura de paredes internas ou externas, material de pintura fornecido pelo cliente.', 
 8, 500.00, 450.00, 
 1, 5, 5, 2);


INSERT INTO servicos_has_cliente (Servicos_idServicos, Cliente_idCliente) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5);


INSERT INTO imagem_produtos (foto, descricao, Servicos_idServicos) VALUES
('0xFFD8FFE000104A464946', 'Imagem da instalação de TV', 1),
('0xFFD8FFE000104A464947', 'Imagem da montagem de móveis', 2),
('0xFFD8FFE000104A464948', 'Imagem do serviço elétrico', 3),
('0xFFD8FFE000104A464949', 'Imagem do serviço hidráulico', 4),
('0xFFD8FFE000104A464950', 'Imagem da pintura residencial', 5);


INSERT INTO banners (imagem, data_validade, descricao) VALUES
('0xFFD8FFE000104A464951', '2025-12-31', 'Promoção de instalação de TV'),
('0xFFD8FFE000104A464952', '2025-11-30', 'Montagem de móveis com desconto'),
('0xFFD8FFE000104A464953', '2025-10-15', 'Serviços elétricos rápidos');


INSERT INTO horarios_servicos 
(hora, forma_pagamento, valor_frete, valor_servico, valor_total, 
 data_entrega, situacao, cod_pix, cod_barras, valor_total_desconto) 
VALUES
('2025-09-20 10:00:00', 'Pix', 25.00, 150.00, 175.00, '2025-09-21', 'Agendado', 'PIX123', '1234567890', 165.00),
('2025-09-21 14:00:00', 'Cartão de Crédito', 20.00, 200.00, 220.00, '2025-09-23', 'Confirmado', 'PIX456', '0987654321', 200.00),
('2025-09-22 09:30:00', 'Dinheiro', 30.00, 100.00, 130.00, '2025-09-23', 'Pendente', 'PIX789', '1122334455', 120.00);


INSERT INTO servicos_has_horarios_servicos (Servicos_idServicos, Horarios_Servicos_idHorarios_Servicos) VALUES
(1, 1),
(2, 2),
(3, 3);




INSERT INTO marido_aluguel_has_servicos (Marido_Aluguel_idMarido_Aluguel, Servicos_idServicos) VALUES
-- Pedro Almeida faz instalação de TV
(1, 1),

-- Lucas Pereira faz montagem de móveis
(2, 2),

-- Rafael Costa faz serviços elétricos
(3, 3),

-- João Nunes faz serviços hidráulicos
(4, 4),

-- Carlos Oliveira faz pintura residencial
(5, 5),

-- Exemplos de múltiplos serviços por profissional
(1, 2), -- Pedro também monta móveis
(2, 3), -- Lucas também faz elétrica
(3, 4), -- Rafael também faz hidráulica
(4, 5), -- João também faz pintura
(5, 1); -- Carlos também instala TV



