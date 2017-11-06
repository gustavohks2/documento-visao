DROP DATABASE IF EXISTS PTS;
CREATE DATABASE PTS;
USE PTS;
CREATE TABLE Aluno (
    idaluno INT AUTO_INCREMENT PRIMARY KEY,
    dataNascimento DATE,
    cpf VARCHAR(14),
    telefone VARCHAR(15),
    email VARCHAR(45),
    nomeAluno VARCHAR(45),
    FK_Endereco INT
);

CREATE TABLE Agenda (
    idAgenda INT AUTO_INCREMENT PRIMARY KEY,
    dataAula DATE,
    horaAula TIME,
    realizada BOOLEAN,
    FK_Aluno INT,
    FK_Endereco_01 INT,
    FK_Treino INT
);

CREATE TABLE Avaliacao (
    altura INT(3),
    peitoral INT(3),
    subescapular INT(3),
    triceps INT(3),
    axilarM INT(3),
    supraIliaca INT(3),
    idAvalia INT AUTO_INCREMENT PRIMARY KEY,
    peso INT(3),
    femuralM INT(3),
    abdominal INT(3),
    FK_Aluno INT
);

CREATE TABLE Endereco (
    uf VARCHAR(2),
    cep VARCHAR(12),
    cidade VARCHAR(45),
    bairro VARCHAR(45),
    numero VARCHAR(10),
    complemento VARCHAR(45),
    logradouro VARCHAR(45),
    idEndereco INT AUTO_INCREMENT PRIMARY KEY,
    apelido VARCHAR(20)
);

CREATE TABLE Exercicio (
    nomeExercicio VARCHAR(45),
    idExercicio INT AUTO_INCREMENT PRIMARY KEY,
    imagemExercicio BLOB
);

CREATE TABLE Treino (
    tipoTreino VARCHAR(20),
    idTreino INT AUTO_INCREMENT PRIMARY KEY,
    FK_Treino_01 INT
);

CREATE TABLE prescrever (
    FK_Exercicio INT,
    FK_Treino_02 INT,
    tempoDescanso TIME,
    peso INT(3),
    repeticoes INT(2),
    series INT(2),
    padrao BOOLEAN
);
 
ALTER TABLE Aluno ADD CONSTRAINT FK_Aluno_1
    FOREIGN KEY (FK_Endereco)
    REFERENCES Endereco (idEndereco)
    ON DELETE RESTRICT ON UPDATE RESTRICT;
 
ALTER TABLE Agenda ADD CONSTRAINT FK_Agenda_1
    FOREIGN KEY (FK_Aluno)
    REFERENCES Aluno (idaluno)
    ON DELETE RESTRICT ON UPDATE RESTRICT;
 
ALTER TABLE Agenda ADD CONSTRAINT FK_Agenda_2
    FOREIGN KEY (FK_Endereco_01)
    REFERENCES Endereco (idEndereco)
    ON DELETE RESTRICT ON UPDATE RESTRICT;
 
ALTER TABLE Agenda ADD CONSTRAINT FK_Agenda_3
    FOREIGN KEY (FK_Treino)
    REFERENCES Treino (idTreino)
    ON DELETE CASCADE ON UPDATE CASCADE;
 
ALTER TABLE Avaliacao ADD CONSTRAINT FK_Avaliacao_1
    FOREIGN KEY (FK_Aluno)
    REFERENCES Aluno (idaluno)
    ON DELETE CASCADE ON UPDATE CASCADE;
 
ALTER TABLE Treino ADD CONSTRAINT FK_Treino_1
    FOREIGN KEY (FK_Treino_01)
    REFERENCES Treino (idTreino);
 
ALTER TABLE prescrever ADD CONSTRAINT FK_prescrever_0
    FOREIGN KEY (FK_Exercicio)
    REFERENCES Exercicio (idExercicio)
    ON DELETE RESTRICT ON UPDATE RESTRICT;
 
ALTER TABLE prescrever ADD CONSTRAINT FK_prescrever_1
    FOREIGN KEY (FK_Treino_02)
    REFERENCES Treino (idTreino)
    ON DELETE SET NULL ON UPDATE CASCADE;