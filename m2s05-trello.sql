
--M2S05 Ex:02 - DDL

CREATE TABLE IF NOT EXISTS Nutricionista (
	id_nutricionista serial PRIMARY KEY,
	nome varchar(128) NOT NULL,
	crn varchar(15) NOT NULL,
	especialidade varchar(128),
	tempo_experiencia integer
);

DROP Table Nutricionista;

CREATE TABLE IF NOT EXISTS Paciente (
	id_paciente serial PRIMARY KEY,
	nome varchar(128) NOT NULL,
	data_nascimento date,
	cpf varchar(11) NOT NULL,
	telefone varchar(20),
	email varchar(128) 
);

DROP Table Paciente;

CREATE TABLE IF NOT EXISTS Consulta (
	id_consulta serial,
	id_nutricionista integer NOT NULL REFERENCES Nutricionista(id_nutricionista),
	id_paciente integer NOT NULL REFERENCES Paciente(id_paciente),
	data_consulta date,
	observacoes text
	);

DROP Table Consulta;

----------

--M2S05 Ex:03 - DML

--Inserts em Nutricionista
INSERT INTO Nutricionista (nome, crn, especialidade, tempo_experiencia)
	VALUES ('Sansa Stark', 'CRN-7/1234/P', 'Nutrição para recuperação pós-batalha', 5),
	('Tyrion Lannister', 'CRN-7/6789', 'Nutrição para festas', 10);

INSERT INTO Nutricionista (nome, crn, especialidade)
	VALUES ('Daenerys Targaryen', 'CRN-7/5749', 'Nutrição para dragões');

INSERT INTO Nutricionista (nome, crn, especialidade, tempo_experiencia)
	VALUES ('Jon Snow', 'CRN-7/2121', 'Nutrição para frio extremo', 3);

SELECT * FROM Nutricionista;

--Inserts em Paciente
INSERT INTO Paciente (nome, data_nascimento, cpf, telefone, email)
	VALUES ('Cersei Lannister', '01/30/1980', '12345678901', '(11) 98765-4321', 'cersei.lannister@kingslanding.com');

INSERT INTO Paciente (nome, data_nascimento, cpf, email)
	VALUES ('Arya Stark', '05/12/1992', '54321098765', 'arya@thenorth.com');

INSERT INTO Paciente (nome, data_nascimento, cpf, telefone)
	VALUES ('Jaime Lannister', '01/30/1980', '34567890123', '+1 (678) 901-2345');

SELECT * FROM Paciente;

--Inserts em Consulta
INSERT INTO Consulta (id_nutricionista, id_paciente, data_consulta, observacoes)
	VALUES (1, 3, '06/06/2024', 'Jaime está se recuperando de ferimentos de batalha e precisa de uma dieta rica em nutrientes para acelerar sua cicatrização. Ele está tomando suplementos de colágeno e evitando alimentos inflamatórios.');

INSERT INTO Consulta (id_nutricionista, id_paciente, data_consulta, observacoes)
	VALUES (2, 2, '06/07/2024', 'Arya é uma lutadora ágil e precisa de uma dieta rica em proteínas para manter sua força.');

INSERT INTO Consulta (id_nutricionista, id_paciente, data_consulta)
	VALUES (3, 1, '06/08/2024');

SELECT * FROM Consulta;

----------

--M2S05 Ex:04 - DDL Relacionamentos
--Os relacionamentos já foram estabelecidos na criação da tabela Consulta mais acima, então vamos refazê-la: 

DROP Table Consulta;

CREATE TABLE IF NOT EXISTS Consulta (
	id_consulta serial,
	id_nutricionista integer,
	id_paciente integer,
	data_consulta date,
	observacoes text
	);

ALTER TABLE Consulta
	ADD FOREIGN KEY (id_nutricionista) REFERENCES Nutricionista(id_nutricionista);

ALTER TABLE Consulta
	ADD	FOREIGN KEY (id_paciente) REFERENCES Paciente(id_paciente);

ALTER TABLE Consulta
	ADD CONSTRAINT id_nutricionista_not_null CHECK (id_nutricionista IS NOT NULL);

ALTER TABLE Consulta
	ADD CONSTRAINT id_paciente_not_null CHECK (id_paciente IS NOT NULL);

SELECT * FROM Consulta;

----------

--M2S05 Ex:06 - DML
--Para fazer um update, vamos antes criar uma consulta:

INSERT INTO Consulta (id_nutricionista, id_paciente, data_consulta, observacoes)
	VALUES (3, 1, '06/08/2024', 'Paciente relata dificuldade em seguir a dieta.');

--As relações já estão estabelecidas (pois se tornaram obrigatórias no ex.4) mas podemos trocar paciente e nutricionista desta consulta:

UPDATE Consulta SET id_nutricionista=1 WHERE id_consulta = 1;

UPDATE Consulta SET id_paciente=3 WHERE id_consulta = 1;

SELECT * FROM Consulta;
