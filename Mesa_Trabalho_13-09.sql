-- Usando a base musimundos_V2, execute as seguintes consultas:
-- 1 - Selecione o nome dos artistas(tabela artistas)  com o nome de seus albuns (tabela albuns) ordenado por id do artista.

USE musimundos;
SELECT artistas.nome, albuns.titulo, albuns.id_artista
FROM artistas
INNER JOIN albuns
ON artistas.nome = albuns.titulo
GROUP BY id_artista
ORDER BY id_artista ASC;

-- 2 - Selecione o nome do cliente (clientes) e suas faturas (faturas), porém somente as faturas com valor maior de 5 ordenados pelo valor da fatura decrescente.

SELECT clientes.nome, faturas.id, faturas.valor_total
FROM clientes
INNER JOIN faturas
ON faturas.valor_total > 5
ORDER BY faturas.valor_total DESC;

-- 3 Selecione o nome das cancoes (tabela cancoes) e o tipo de arquivo (tabela tipos_de_arquivos) e exiba o nome da canção e o tipo ordenado pelo id da canção.

SELECT cancoes.nome, cancoes.id, tipos_de_arquivo.nome, tipos_de_arquivo.id
FROM cancoes
INNER JOIN tipos_de_arquivo
ON cancoes.nome = tipos_de_arquivo.id
GROUP BY cancoes.nome
ORDER BY cancoes.id ASC;
