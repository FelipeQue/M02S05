--M2S05 Ex:07 - Updates e deletes para cada tabela

UPDATE Nutricionista SET especialidade='Nutrição para conquistadores' WHERE id_nutricionista = 3;

UPDATE Paciente SET email='usurper@kingslanding.com' WHERE nome = 'Jaime Lannister';

UPDATE Consulta SET id_nutricionista = 2 WHERE id_consulta = 1;

--Vou acrescentar mais um registro para depois apagar dois de uma vez com base na condição.
INSERT INTO Nutricionista (nome, crn)
	VALUES ('Ned Stark', 'CRN-7/0001');

SELECT * FROM Nutricionista;

SELECT * FROM Paciente;

SELECT * FROM Consulta;

DELETE FROM Nutricionista WHERE nome LIKE '%Stark%';

DELETE FROM Paciente WHERE telefone IS NULL;

DELETE FROM Consulta WHERE id_paciente = 3;






