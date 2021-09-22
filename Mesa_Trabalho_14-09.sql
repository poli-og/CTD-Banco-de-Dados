USE emarket;

-- Para cada empresa de correio, calcule o transporte total. Inclua todas as empresas de
-- correio, mesmo que não tenham realizado nenhuma operação.

SELECT Correios.Empresa, sum(Faturas.Transporte)
FROM Correios
left JOIN Faturas
ON Correios.CorreioID = Faturas.FormaEnvio
group by Correios.Empresa;

-- Liste as informações de contato (ou, endereço, etc.) dos clientes que não fizeram
-- compras. Exiba as informações no formato considerado mais adequado.

select Clientes.Contato, Clientes.Endereco, Faturas.ClienteID
from Clientes
left join Faturas
on Clientes.ClienteID = Faturas.ClienteID
where Faturas.ClienteID IS NULL;


-- Liste as categorias e seus produtos, incluindo as categorias para as quais não há
-- produtos no banco de dados.
-- Para nomes de produtos, onde mix ou Chef diz, substituí-lo por MIX ou CHEF, respectivamente.


select Categorias.CategoriaID, Categorias.CategoriaNome, Produtos.ProdutoNome
from Categorias
left join Produtos
ON Categorias.CategoriaID = Produtos.CategoriaID


