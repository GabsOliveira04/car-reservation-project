CREATE DATABASE ACDN_RentalCar;

USE ACDN_RentalCar;


CREATE TABLE ClassesDeCarro (
  Nome VARCHAR(50) NOT NULL,
  Valor_da_Diaria DECIMAL(10,2) NOT NULL,
  PRIMARY KEY (Nome)
);

CREATE TABLE Sedes (
  Nome VARCHAR(100) NOT NULL,
  Endereco VARCHAR(200) NOT NULL,
  Telefone VARCHAR(20) NOT NULL,
  Nome_do_Gerente VARCHAR(100) NOT NULL,
  Multa_por_entrega_em_outro_ponto DECIMAL(10,2) NOT NULL,
  PRIMARY KEY (Nome)
);

CREATE TABLE Clientes (
  Nome VARCHAR(100) NOT NULL,
  CPF VARCHAR(14) NOT NULL,
  Numero_da_CNH VARCHAR(20) NOT NULL,
  Validade_da_CNH DATE NOT NULL,
  Categoria_da_CNH VARCHAR(5) NOT NULL,
  PRIMARY KEY (CPF)
);


CREATE TABLE Carros (
  Placa VARCHAR(10) NOT NULL,
  Modelo VARCHAR(50) NOT NULL,
  Ano INT NOT NULL,
  Quilometragem INT NOT NULL,
  Descricao VARCHAR(255),
  ClassesDeCarro_Nome VARCHAR(50) NOT NULL,
  Sedes_Nome_localizacao_atual VARCHAR(100),
  PRIMARY KEY (Placa),
  FOREIGN KEY (ClassesDeCarro_Nome) REFERENCES ClassesDeCarro(Nome),
  FOREIGN KEY (Sedes_Nome_localizacao_atual) REFERENCES Sedes(Nome)

);

CREATE TABLE Reservas (
  Numero_da_Reserva INT NOT NULL AUTO_INCREMENT,
  Quantidade_de_Diarias INT NOT NULL,
  Data_de_Locacao DATE NOT NULL,
  Data_de_Retorno DATE NOT NULL,
  Quilometros_Rodados INT,
  Multa DECIMAL(10,2) DEFAULT 0,
  Situacao VARCHAR(30) NOT NULL,
  Valor_Total DECIMAL(10,2) NOT NULL,
  Clientes_CPF VARCHAR(14) NOT NULL,
  Carros_Placa VARCHAR(10) NOT NULL,
  Sedes_Nome_locacao VARCHAR(100) NOT NULL,
  Sedes_Nome_devolucao VARCHAR(100) NOT NULL,
  PRIMARY KEY (Numero_da_Reserva),
  FOREIGN KEY (Clientes_CPF) REFERENCES Clientes(CPF),
  FOREIGN KEY (Carros_Placa) REFERENCES Carros(Placa),
  FOREIGN KEY (Sedes_Nome_locacao) REFERENCES Sedes(Nome),
  FOREIGN KEY (Sedes_Nome_devolucao) REFERENCES Sedes(Nome)
);