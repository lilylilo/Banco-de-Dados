CREATE DATABASE IF NOT EXISTS aula2503
CHARACTER SET utf8mb4
COLLATE utf8mb4_unicode_ci;

USE aula2503;
SHOW TABLES;

-- TABELA PARA EXEMPLOS
CREATE TABLE cliente (
    codCliente INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(40) NOT NULL,
    contato VARCHAR(20),
    endereco VARCHAR(30) NOT NULL,
    cidade VARCHAR(20) NOT NULL,
    codPostal VARCHAR(10) NOT NULL,
    pais VARCHAR(15) NOT NULL,
    categoria TINYINT NOT NULL DEFAULT 5
);


-- INSERINDO DADOS
/*É possível escrever o comando INSERT INTO de duas maneiras. 
A primeira é especificando tanto os nomes das colunas (sendo desnecessário para campos com auto incremento) quanto os valores a serem inseridos.
INSERT INTO nome_da_tabela 
(coluna1, coluna2, coluna3, ...)
VALUES (valor1, valor2, valor3, ...);*/

-- inserção de múltiplas linhas em uma única instrução:
INSERT INTO cliente
(nome, contato, endereco, cidade, 
    codPostal, pais)
VALUES ('Antonio Moreno Taquería', 'Antonio Moreno', 
    'Mataderos 2312', 'Cidade do México', '05023', 
    'México'), 
('Around the Horn', 'Thomas Hardy', 
    '120 Hanover Sq.', 'Londres', 'WA1 1DP', 
    'Reino Unido'), 
('Berglunds snabbköp', 'Christina Berglund', 
    'Berguvsvägen 8', 'Luleå', 'S-958 22', 
    'Suécia');
    
INSERT INTO cliente
(nome, contato, endereco, cidade, 
    codPostal, pais)
VALUES ('Ana Trujillo Helados', 'Ana Trujillo', 
    'Avda. de la Constitución 2222', 
    'Cidade do México', '05021', 
    'México');
    
INSERT INTO cliente
(nome, contato, endereco, cidade, 
    codPostal, pais, categoria)
VALUES ('Alfreds Futterkiste', 'Maria Anders', 
    'Obere Str. 57', 'Berlim', '12209', 
    'Alemanha', 4);


-- RECUPERANDO DADOS
/*O comando SELECT é utilizado para recuperar dados de uma tabela em um banco de dados MySQL. 
Com ele, podemos buscar registros específicos ou até mesmo todos os registros de uma tabela.
*/
SELECT * FROM cliente;

-- Contudo, é possível recuperar campos específicos
SELECT nome, cidade FROM cliente;


-- SELEÇÃO DE VALORES DISTINTOS
/*O comando SELECT DISTINCT é utilizado para retornar apenas valores distintos de uma ou mais colunas de uma tabela no MySQL. 
Isso é útil quando queremos listar apenas os valores únicos de uma coluna, eliminando duplicatas.

SELECT DISTINCT coluna1, coluna2, ...
FROM nome_da_tabela;
*/
SELECT DISTINCT pais FROM cliente;


/*Também é possível usar a função COUNT junto com DISTINCT para contar o número de valores distintos em uma coluna.
*/
SELECT COUNT(DISTINCT pais) FROM cliente;

-- FILTRANDO RESULTADOS
/*O comando WHERE é utilizado no MySQL para filtrar os resultados de uma consulta com base em condições específicas.
 Isso nos permite recuperar apenas os registros que atendem a determinados critérios.

SELECT coluna1, coluna2, ...
FROM nome_da_tabela
WHERE condição;
*/

-- Suponha que da tabela cliente queiramos selecionar apenas os registros cujo país seja "México". Podemos fazer isso da seguinte forma
SELECT contato, endereco, codPostal
FROM cliente WHERE pais = 'México';

-- Selecionar clientes com código acima de 3
SELECT * FROM cliente WHERE codCliente > 3;

-- Selecionar clientes cujo contato começa com "A"
SELECT * FROM cliente WHERE contato LIKE 'A%';

-- Selecionar clientes cujo país seja "México" ou "Suécia"
SELECT * FROM cliente 
WHERE pais IN ('México', 'Suécia');

-- Selecionar clientes cujo código seja entre 2 e 4, inclusive
SELECT * FROM cliente 
WHERE codCliente BETWEEN 2 AND 4;

-- ORDENAÇÃO
/*A cláusula ORDER BY é utilizada para ordenar os registros retornados por uma consulta em ordem ascendente ou descendente, com base em uma ou mais colunas.

SELECT coluna1, coluna2, ...
FROM nome_da_tabela
ORDER BY coluna1, coluna2, ... ASC|DESC;
*/
-- Suponha que queremos selecionar todos os clientes da tabela "cliente" e ordená-los pelo contato em ordem alfabética. Podemos fazer isso da seguinte maneira

SELECT * FROM cliente ORDER BY contato;

/*Por padrão, a ordenação é feita em ordem ascendente. 
No entanto, se quisermos ordenar os registros em ordem descendente, podemos usar a palavra-chave DESC após a coluna de ordenação:
*/
SELECT * FROM cliente ORDER BY nome DESC;

/*Também podemos ordenar os registros por várias colunas. 
Por exemplo, se quisermos ordenar os clientes por país em ordem descendente e, em seguida, por contato em ordem alfabética, podemos fazer isso da seguinte maneira:
*/
SELECT * FROM cliente 
ORDER BY pais DESC, contato ASC;


-- OPERADORES AND e OR
/*Os operadores AND e OR são utilizados para filtrar registros com base em múltiplas condições em uma cláusula WHERE.

O operador AND é utilizado para filtrar registros onde todas as condições especificadas são verdadeiras.

SELECT coluna1, coluna2, ...
FROM nome_da_tabela
WHERE condição1 AND condição2 AND condição3 ...;

Suponha que queremos selecionar todos os clientes da tabela cliente que estão localizados no México e cujo código postal seja maior que 05022. Podemos fazer isso da seguinte maneira:
*/
SELECT * FROM cliente
WHERE pais = 'México' AND codPostal > '05022';


/*O operador OR é utilizado para filtrar registros onde pelo menos uma das condições especificadas é verdadeira.

SELECT coluna1, coluna2, ...
FROM nome_da_tabela
WHERE condição1 OR condição2 OR condição3 ...;

Suponha que queremos selecionar todos os clientes da tabela cliente que estão localizados na cidade de Berlim ou cujo país seja Suécia. Podemos fazer isso da seguinte maneira
*/
SELECT * FROM cliente
WHERE cidade = 'Berlim' OR pais = 'Suécia';


/*Podemos combinar os operadores AND e OR para criar condições mais complexas de filtragem.

Suponha que queremos selecionar todos os clientes da tabela cliente que estão localizados na cidade de Berlim ou Londres e cujo país seja Alemanha ou Suécia. Podemos fazer isso da seguinte maneira
*/
SELECT * FROM cliente
WHERE (cidade = 'Berlim' OR cidade = 'Londres')
AND (pais = 'Alemanha' OR pais = 'Suécia');


-- OPERADOR NOT
/*O operador NOT é utilizado em combinação com outros operadores para obter o resultado oposto, também chamado de resultado negativo.

Suponha que queremos selecionar apenas os clientes que NÃO são do México na tabela cliente. Podemos fazer isso da seguinte maneira

SELECT * FROM cliente WHERE NOT pais = 'México';

No exemplo acima, o operador NOT é utilizado em combinação com o operador =, mas também pode ser utilizado em combinação com outros operadores de comparação e/ou lógicos, como nos exemplos abaixo
*/
-- Selecionar clientes cujos nomes não começam com a letra “A”:
SELECT * FROM cliente WHERE nome NOT LIKE 'A%';

-- Selecionar clientes cujo código de cliente não está entre 2 e 4
SELECT * FROM cliente
WHERE codCliente NOT BETWEEN 2 AND 4;

-- Selecionar clientes que não são de Cidade do México ou Londres
SELECT * FROM cliente
WHERE cidade NOT IN ('Cidade do México', 'Londres');

-- Selecionar clientes com um código não maior que 3
SELECT * FROM cliente WHERE NOT codCliente > 3;

-- Selecionar clientes com um código não menor que 3
SELECT * FROM cliente WHERE NOT codCliente < 3;


-- NOMEANDO COLUNAS
/*É possível (e mesmo recomendado, em certas situações) ajustar o nome das colunas em um SELECT, como no exemplo abaixo
*/
SELECT codCliente AS 'Código', nome AS 'Cliente', 
       contato AS 'Contato', endereco AS 'Endereço', 
       cidade AS 'Cidade', 
       codPostal AS 'Código Postal', 
       pais AS 'País', categoria AS 'Categoria'
FROM cliente;



delete from cliente where codCliente=5;

