-- cria a base
CREATE DATABASE IF NOT EXISTS hospital;

-- informa ao MySQL Server qual a base sobre a qual desejamos operar
USE hospital;

-- cria tabela medico
CREATE TABLE IF NOT EXISTS tb_medico (
	crm INT PRIMARY KEY,
    nome VARCHAR(200) NOT NULL
);

-- cria tabela paciente
CREATE TABLE IF NOT EXISTS tb_paciente (
	cpf BIGINT PRIMARY KEY,
    nome VARCHAR (200) NOT NULL,
    idade SMALLINT NOT NULL
);

-- cria tabela consulta
DROP TABLE tb_consulta;
CREATE TABLE tb_consulta (
	crm INT NOT NULL,
    cpf BIGINT NOT NULL,
    data_hora DATETIME NOT NULL,
    PRIMARY KEY (crm, cpf, data_hora),
    CONSTRAINT fk_medico FOREIGN KEY (crm) REFERENCES tb_medico(crm),
    CONSTRAINT fk_paciente FOREIGN KEY (cpf) REFERENCES tb_paciente(cpf)
);

INSERT INTO tb_medico (crm, nome) VALUES (12345, 'José');
INSERT INTO tb_paciente (cpf, nome, idade) VALUES (998877, 'Maria', 22);
INSERT INTO tb_paciente (cpf, nome, idade) VALUES (11111111, 'Antônio', 30);

INSERT INTO tb_consulta (crm, cpf, data_hora) VALUES (12345, 998877, '2021-10-12 13:53:00');
INSERT INTO tb_consulta (crm, cpf, data_hora) VALUES (12345, 998877, '2021-10-13 18:00:00');
INSERT INTO tb_consulta (crm, cpf, data_hora) VALUES (12345, 11111111, '2021-10-17 22:00:00');
-- todos os médicos
SELECT * FROM tb_medico;
-- todos os pacientes
SELECT * FROM tb_paciente;
-- todas as consultas
SELECT * FROM tb_consulta;

-- todas as consultas ordenadas por data
SELECT * FROM tb_consulta ORDER BY data_hora;
-- todas as consultas ordenadas por data, mais recentes primeiro
SELECT * FROM tb_consulta ORDER BY data_hora DESC;



