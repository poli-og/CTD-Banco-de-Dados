USE musimundos;

SELECT id FROM faturas;
SELECT valor_total FROM faturas;
SELECT MAX(valor_total) FROM faturas WHERE cidade_cobranca = "Oslo";
SELECT MIN(valor_total) FROM faturas;
SELECT AVG(valor_total) FROM faturas WHERE pais_cobranca = "Canada";
SELECT COUNT(id) FROM faturas WHERE pais_cobranca = "Canada";
SELECT SUM(valor_total) FROM faturas;
SELECT id, data_fatura, valor_total FROM faturas WHERE valor_total < (SELECT AVG(valor_total) FROM faturas);

SELECT MAX(data_nascimento) FROM empregados;
SELECT MIN(data_nascimento) FROM empregados;
SELECT DATE_FORMAT(data_nascimento, "%d %M %Y") FROM empregados;

SELECT COUNT(nome) FROM cancoes WHERE compositor = "AC/DC";
SELECT AVG(duracao_milisegundos) FROM cancoes;
SELECT AVG(bytes) FROM cancoes WHERE compositor = "AC/DC";

SELECT  COUNT(nome) FROM clientes WHERE cidade = "São Paulo";
SELECT COUNT(id) FROM clientes WHERE cidade = "Paris";
SELECT COUNT(id) FROM clientes WHERE email LIKE '%yahoo%';