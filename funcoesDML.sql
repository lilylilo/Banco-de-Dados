-- ****MANIPULAÇÃO DE CARACTERES**** 
-- O MySQL fornece diversas funções de manipulação de caracteres que podem ser utilizadas nas instruções SQL

-- CHAR_LENGTH
-- Retorna o número de caracteres em uma string.*/
SELECT char_length('Madame Hooch');

-- FORMAT
-- Formata um número com o número de casas decimais especificado.
SELECT format(1234567.89012, 2);

-- REPLACE
-- Substitui todas as ocorrências de uma substring por outra em uma string.
SELECT replace('Sibila Lockhart', 
               'Lockhart', 'Trelawney');

-- SUBSTR
-- Retorna uma parte de uma string a partir de uma posição e com um comprimento especificados.
SELECT substr('Guilhermina Grubbly-Plank', 13, 7); 

-- TRIM
-- Remove espaços em branco do início e do final de uma string.
SELECT trim('  Argus Filch  ');


-- ****FUNÇÕES NUMÉRICAS****
-- O MySQL fornece também funções numéricas para o SQL

-- CEIL
-- Retorna o menor número inteiro maior ou igual a um número especificado.
SELECT ceil(5.7);

-- FLOOR
-- Retorna o maior número inteiro menor ou igual a um número especificado.
SELECT floor(5.7);

-- RAND
-- Retorna um número decimal aleatório entre 0 e 1.
SELECT rand();

-- Esta função é particularmente interessante para listar registros em ordem aleatória, como no exemplo seguinte

SELECT codCliente, contato, cidade, 
       pais, rand() AS 'ordem'
FROM cliente ORDER BY ordem;


-- ****FUNÇÕES DATA E HORA****
-- Por fim, o MySQL implementa diversas funções para manipulação de data e hora

-- ADDDATE
-- Adiciona um intervalo especificado a uma data e retorna o resultado.
SELECT adddate('2024-02-05', INTERVAL 7 DAY);

-- CURDATE
-- Retorna a data atual.
SELECT curdate();

-- CURTIME
-- Retorna a hora atual.
SELECT curtime();

-- DATE_FORMAT
-- Formata uma data de acordo com o formato especificado.
SELECT date_format('2024-02-05', '%d/%m/%Y');

-- STR_TO_DATE
-- Converte uma string em uma data, usando o formato especificado.
SELECT str_to_date('05/02/2024', '%d/%m/%Y');