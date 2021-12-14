
							*********Principais comandos de banco de dados********


**CREATE DATABASE "Nome do banco"; //Para Criar o banco de dados

**CREATE TABLE "Nome da tabela"; //Cria a tabela.

##Estrutura basica da tabela

**utf8_general_ci //Para configurar o indioma para "pt"
##Exemplo criação digitando o banco: Existe a forma mais simples de criar a tabela do banco pelo PHPmyadmin

CREATE TABLE usuarios (
	ID int(10) , ##Para números inteiros.Depos pelo phpmyadmin adicione o id como primay key e A.I auto incremeto. 
	NOME varchar(100), ##varchar, Para caracteres tipo string
	EMAIL varchar(80),  ##varchar, Para caracteres tipo string
	SENHA int(15),  ##Para cadastrar senhas
	DATA_NASCIMENTO date ##Para cadastro de apenas ano
)
  
											****Comandos*****


	*****Comando para localizar a tabela*****
##Exemplo abaixo
SELECT * FROM `pessoas`
//Código em PHP
$sql = "SELECT * FROM `pessoas`";


 		*******Para adicionar algo em uma tabela, comando INSERT INTO *****

##Exemplo abaixo
INSERT INTO `pessoas` (`ID`, `NOME`, `EMAIL`, `SENHA`, `DATA_NASCIMENTO`) VALUES (NULL, 'Carlos', 'carlos@gmail.com', '123445', '2021-06-17');
//codigo em PHP
$sql = "INSERT INTO `pessoas` (`ID`, `NOME`, `EMAIL`, `SENHA`, `DATA_NASCIMENTO`) VALUES (NULL, \'Carlos\', \'carlos@gmail.com\', \'123445\', \'2021-06-17\')";

		
		*******Para acrescentar uma nova coluna em uma tabela********

##Exemplo
ALTER TABLE `pessoas` ADD `faixa_salarial` TINYINT(1) NOT NULL AFTER `Id`; ##Adiciona a coluna faixa_salaria na tabela pessoas
//Código em PHP
$sql = "ALTER TABLE `pessoas`  ADD `faixa_salarial` TINYINT(1) NOT NULL  AFTER `Id`";


		*******Para realizar alteracões, comando ALTER TABLE ********

##Exemplo abaixo
ALTER TABLE `pessoas` CHANGE `ID` `ID` INT(10) NOT NULL AUTO_INCREMENT, add PRIMARY KEY (`ID`); 
UPDATE `pessoas` SET `faixa_salarial` = '1' WHERE `pessoas`.`Id` = 1; ##Outro tipo mais comum de edição
//Código em PHP
$sql = "ALTER TABLE `pessoas`  ADD `Id` INT(10) NOT NULL AUTO_INCREMENT  FIRST,  ADD   PRIMARY KEY  (`Id`)";
$sql = "UPDATE `pessoas` SET `faixa_salarial` = \'1\' WHERE `pessoas`.`Id` = 1";


		*******Para deletar uma linha de uma tabela, comando DELETE FROM ******

##Exemplo abaixo, Nunca esquecer da condição WHERE
DELETE FROM `pessoas` WHERE `pessoas`.`Id` = 2
////Código em PHP
$sql = "DELETE FROM `pessoas` WHERE `pessoas`.`Id` = 2";


		********Para selecionar tudo de uma tabela, comando SELECT * FROM ********

##exemplo
SELECT * FROM `pessoas` //Ira puxar todo conteudo da tabela

//Para fazer a seleção de uma coluna ou mais de uma tabela, comando SELECT
##Exemplo abaixo
SELECT nome, email FROM `pessoas`
//Código em PHP
$sql = "SELECT nome, email FROM `pessoas`";


		*************Filtrando dados de uma tabela*************************

 *****Comandos SELECT, OR, LIKE, BETWEEN, IN
##Exemplo
SELECT * FROM pessoas WHERE id= 2 OR id = 4 ##Para consultar a pessoa de id 2 ou 4
SELECT * FROM pessoas WHERE email = 'eduardo@gmail.com' AND senha = '999999' ##Serve para fazer login
SELECT * FROM pessoas WHERE nome LIKE 'Edu%' ou '%du', '%ard%' ## O like serve para pesquisar um nome pelo começo ou final junto com a % para auxiliar o comando.
SELECT * FROM pessoas WHERE DATA_NASCIMENTO BETWEEN '2005-05-19' AND '2021-07-17'##Retorna os usuarios entre essas datas 
SELECT * FROM pessoas WHERE id IN (1,3,2) ##Nesse exemplo retorna os usuarios de id dentro dos (1,3)
//OBS: SELECT pessoas.nome ##Esse comando por exemplo é utilisado para especificar a tabela quando se tem mais de uma tabela com mesmo nome de coluna
//Código em PHP
$sql = "SELECT * FROM pessoas WHERE ID= 2 OR ID= 4";
$sql = "SELECT * FROM pessoas WHERE email = \'eduardo@gmail.com\' AND senha = \'999999\'";
$sql = "SELECT * FROM pessoas WHERE nome LIKE 'Edu%'";
$sql = "SELECT * FROM pessoas WHERE DATA_NASCIMENTO BETWEEN \'2005-05-19\' AND \'2021-07-17\'";
$sql = "SELECT * FROM pessoas WHERE id IN (1,3,2)";


		*******Agrupando com GROUP BY ******
##Exemplo
SELECT COUNT(*) as contagem, faixa_salarial FROM pessoas GROUP BY faixa_salarial ##Faz uma contagem de quantas pessoas são daquela faixa salarial
//Código em PHP
$sql = "SELECT COUNT(*) as contagem, faixa_salarial FROM pessoas GROUP BY faixa_salarial";


				*******Ordenando tabelas**************

***Comandos 
ORDER BY //Ordenar 
LIMIT //Limita o que se quer procurar 
ASC //Ascendente 
DESC //Decresente
##Exemplo
SELECT * FROM pessoas ORDER BY nome ASC ##Ordena de forma ascendente, nesse caso ordem alfabética.
SELECT * FROM pessoas ORDER BY nome DESC ##Ordena de forma decresente, nesse caso ordem alfabética.
SELECT * FROM pessoas ORDER BY nome ASC LIMIT 3 ##Ordena pro ordem alfabetica, mostrando o limite de 3 resultados.
SELECT * FROM pessoas LIMIT 1,2 ##Ordena limitando nesse casso ele esta pulando o primeiro e retornado dois resultados.
//Código em PHP
$sql = "SELECT * FROM pessoas ORDER BY nome ASC";
$sql = "SELECT * FROM pessoas ORDER BY nome DESC";
$sql = "SELECT * FROM pessoas ORDER BY nome ASC LIMIT 3";
$sql = "SELECT * FROM pessoas LIMIT 1,2";


			********Para realizar atualizações update***********

##Exemplo
UPDATE `pessoas` SET `NOME` = 'Julio Batista' WHERE `pessoas`.`Id` = 6; // O UPDATE para atualizar e o SET é o que ira ser alterado nesse ex. `NOME` e,
WHERE para gera a condição de quem será a atualizações !!!***nunca esquecer da condição***!!!

//Código em PHP
$sql = "UPDATE `pessoas` SET `NOME` = \'Julio Batista\' WHERE `pessoas`.`Id` = 6";

-----------------------------------------------------------------------------------------------------------------------

**********************Relacionamentos de tabelas***************************

1:N  ##Um para muitos
1:1  ##Um para um
N:N  ##Varios para varios

***//Utilizando os comandos de Relacionamentos INNER JOIN, LEFT JOIN, RIGHT JOIN

##Exemplo
SELECT pessoas.nome, faixas.titulo FROM pessoas INNER JOIN faixas ON faixas.id = pessoas.faixa_salarial; ##Aqui faz a junção da faixa_salarial
##Com a outra tabela o INNER JOIN só busca resultados satisfatorios
SELECT pessoas.nome, faixas.titulo FROM pessoas LEFT JOIN faixas ON faixas.id = pessoas.faixa_salarial; ##Retorna todos os resultados da tabela,
##da esquerda  que no caso é pessoas EX.pessoas(Esquerda) LEFT JOIN faixas(Direita)
SELECT pessoas.nome, faixas.titulo FROM pessoas RIGHT JOIN faixas ON faixas.id = pessoas.faixa_salarial; ##Retorna todos os resultados da tabela,
##da direita  que no caso é pessoas EX.pessoas(Esquerda) RIGHT JOIN faixas(Direita)
SELECT pessoas.id, pessoas.nome, pessoas.email, pessoas.data_nascimento, faixas.titulo as faixas FROM pessoas LEFT JOIN faixas ON faixas.id = pessoas.faixa_salarial;
##Com esse codigo filtramos fazendo a junção das tabelas
SELECT pessoas.nome FROM pessoas LEFT JOIN faixas ON faixas.id = pessoas.faixa_salarial WHERE faixas.titulo = '0 - 1000'
##Aqui ao utilizar o WHERE fazemos um filtro da pesquisa na outra tabela
//Código em PHP
$sql = "SELECT pessoas.nome, faixas.titulo FROM pessoas INNER JOIN faixas ON faixas.id = pessoas.faixa_salarial";
$sql = "SELECT pessoas.nome, faixas.titulo FROM pessoas LEFT JOIN faixas ON faixas.id = pessoas.faixa_salarial";
$sql = "SELECT pessoas.nome, faixas.titulo FROM pessoas RIGHT JOIN faixas ON faixas.id = pessoas.faixa_salarial";
$sql = "SELECT pessoas.id, pessoas.nome, pessoas.email, pessoas.data_nascimento, faixas.titulo as faixas FROM pessoas LEFT JOIN faixas ON faixas.id = pessoas.faixa_salarial";
$sql = "SELECT pessoas.nome FROM pessoas LEFT JOIN faixas ON faixas.id = pessoas.faixa_salarial WHERE faixas.titulo = \'0 - 1000\'";

*****************************Criando funções*****************************




