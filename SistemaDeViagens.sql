-- Criação da tabela Carro
CREATE TABLE Carro (
    Codigo NUMBER PRIMARY KEY,
    Placa VARCHAR2(10) UNIQUE NOT NULL,
    Marca VARCHAR2(50) NOT NULL,
    Modelo VARCHAR2(50) NOT NULL,
    Ano NUMBER(4) NOT NULL,
    NomeMotorista VARCHAR2(100) NOT NULL
);

-- Criação da tabela Passageiro
CREATE TABLE Passageiro (
    CPF VARCHAR2(11) PRIMARY KEY,
    Nome VARCHAR2(100) NOT NULL,
    Email VARCHAR2(100),
    Telefone VARCHAR2(20),
    BairroResidencia VARCHAR2(100),
    MetodoPagamento VARCHAR2(50) NOT NULL
);

-- Criação da tabela Viagem
CREATE TABLE Viagem (
    IDViagem NUMBER PRIMARY KEY,
    PrecoCobrado NUMBER(10, 2) NOT NULL,
    DistanciaPercorrida NUMBER(10, 2) NOT NULL,
    DataViagem DATE NOT NULL,
    CarroCodigo NUMBER,
    PassageiroCPF VARCHAR2(11),
    CONSTRAINT FK_Carro FOREIGN KEY (CarroCodigo) REFERENCES Carro(Codigo),
    CONSTRAINT FK_Passageiro FOREIGN KEY (PassageiroCPF) REFERENCES Passageiro(CPF)
);

-- Criação da tabela ViagemUrbana
CREATE TABLE ViagemUrbana (
    IDViagem NUMBER PRIMARY KEY,
    BairroPartida VARCHAR2(100) NOT NULL,
    CONSTRAINT FK_ViagemUrbana FOREIGN KEY (IDViagem) REFERENCES Viagem(IDViagem)
);

-- Criação da tabela ViagemInterurbana
CREATE TABLE ViagemInterurbana (
    IDViagem NUMBER PRIMARY KEY,
    CidadeDestino VARCHAR2(100) NOT NULL,
    TaxaAdicional NUMBER(10, 2) NOT NULL,
    CONSTRAINT FK_ViagemInterurbana FOREIGN KEY (IDViagem) REFERENCES Viagem(IDViagem)
);

