drop database if exists vendy;
create database vendy;
use vendy;
/*comercio (nome, cnpj, endereco, telefone)*/
create table comercio (nome varchar(100) not null, cnpj varchar(20) not null, endereco varchar(50), telefone varchar(10), primary key (cnpj));
/*empregado (CPF, sexo, dt_nsc, nome, cnpj_comercio)*/
create table empregado (cpf varchar(14) not null, genero smallint, dt_nsc varchar(10), nome varchar(100) not null, cnpj_comercio varchar(20), usuario varchar(20), senha varchar(20), tipo smallint, primary key (cpf));
/*estoqusta(cpf_emp, cod)*/
create table estoquista (cpf_emp varchar(10) not null, cod int, primary key (cod));
/*operador (cpf_emp, cod)*/
create table operador (cpf_emp varchar(10) not null, cod int, primary key (cod));
/*produto (cod, nome, preco, categoria)*/
create table produto (cod int not null auto_increment, nome varchar(100), preco double, categoria varchar(100), estoque int, primary key(cod));
/*pedido (cod, cod_produto, data, preco, cod_operador, cpf_cliente)*/
create table pedido (cod int not null auto_increment, cod_produto varchar(10000), data_pedido varchar(50), preco decimal, cpf_cliente varchar(20), desconto decimal, vendedor varchar(100), primary key(cod));
/*cliente (CPF, nome, dt_nsc, sexo)*/
create table cliente (cpf varchar(14) not null, nome varchar (100), dt_nsc varchar(10), genero char, primary key(cpf));
/*caixa (id, data_abertura, data_fechamento, fundo_abertura, fundo_fechamento*/
create table caixa (id int auto_increment not null, data_abertura date, data_fechamento date, fundo_abertura decimal, fundo_fechamento decimal, primary key(id));
/* adicionar fk em empregado*/
ALTER TABLE `vendy`.`empregado` 
ADD INDEX `cnpj_idx` (`cnpj_comercio` ASC);
ALTER TABLE `vendy`.`empregado` 
ADD CONSTRAINT `cnpj_comercio`
  FOREIGN KEY (`cnpj_comercio`)
  REFERENCES `vendy`.`comercio` (`cnpj`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;
  
/* adicionar fk em estoquista*/
ALTER TABLE `vendy`.`estoquista` 
ADD INDEX `cpf_emp_idx` (`cpf_emp` ASC) ;

ALTER TABLE `vendy`.`estoquista` 
ADD CONSTRAINT `cpf_emp`
  FOREIGN KEY (`cpf_emp`)
  REFERENCES `vendy`.`empregado` (`cpf`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;

/*adicionar fk em operador*/
ALTER TABLE `vendy`.`operador` 
ADD INDEX `cpf_emp_idx_op` (`cpf_emp` ASC);
ALTER TABLE `vendy`.`operador` 
ADD CONSTRAINT `cpf_emp_op`
  FOREIGN KEY (`cpf_emp`)
  REFERENCES `vendy`.`empregado` (`cpf`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;
  
insert into comercio (nome, cnpj, endereco, telefone) values ("João", "0123456789", "Rua dos penas, 10", "0116587852");

insert into empregado (cpf, genero, dt_nsc, nome, cnpj_comercio, usuario, senha, tipo) values ("40305550", 1, '30/05/1991', "Pedro", "0123456789", "pedro", "0123", 1);
insert into empregado (cpf, genero, dt_nsc, nome, cnpj_comercio, usuario, senha, tipo) values ("11122233", 1, '10/07/2001', "Caio", "0123456789", "caio", "0123", 2);
insert into empregado (cpf, genero, dt_nsc, nome, cnpj_comercio, usuario, senha, tipo) values ("123654789", 1, '22/07/1996', "Gabriel", "0123456789", "gabriel", "123", 2);

insert into produto (nome, preco, categoria, estoque) values ("X-Salada", 7, "Lanches", 10);
insert into produto (nome, preco, categoria, estoque) values ("X-Egg", 9, "Lanches", 10);
insert into produto (nome, preco, categoria, estoque) values ("X-Bacon", 10, "Lanches", 10);
insert into produto (nome, preco, categoria, estoque) values ("X-Tudo", 15, "Lanches", 10);
insert into produto (nome, preco, categoria, estoque) values ("X-Frango", 10, "Lanches", 10);
insert into produto (nome, preco, categoria, estoque) values ("Salgado", 3.50, "Lanches", 10);
insert into produto (nome, preco, categoria, estoque) values ("Baguetes", 8.50, "Lanches", 10);
insert into produto (nome, preco, categoria, estoque) values ("X-Picanha", 14, "Lanches", 10);
insert into produto (nome, preco, categoria, estoque) values ("Misto Quente", 5, "Lanches", 10);
insert into produto (nome, preco, categoria, estoque) values ("Pão na Chapa", 2.50, "Lanches", 10);
insert into produto (nome, preco, categoria, estoque) values ("Mini-Pizza", 7, "Lanches", 10);
insert into produto (nome, preco, categoria, estoque) values ("Pão de Queijo", 4, "Lanches", 10);
insert into produto (nome, preco, categoria, estoque) values ("Sanduiche natural", 6.5, "Lanches", 10);
insert into produto (nome, preco, categoria, estoque) values ("Wrap de Carne", 7, "Lanches", 10);
insert into produto (nome, preco, categoria, estoque) values ("Wrap de Frango", 7, "Lanches", 10);

insert into produto (nome, preco, categoria, estoque) values ("Coca-cola 350ml", '2.05', "Bebidas", 10);
insert into produto(nome, preco, categoria, estoque)values ("Coca-cola 1,5l", 5.49, "Bebidas", 10);
insert into produto (nome, preco, categoria, estoque) values ("Coca-cola 2l", 6.49, "Bebidas", 10);
insert into produto (nome, preco, categoria, estoque) values ("Guaraná", 9, "Bebidas", 10);
insert into produto (nome, preco, categoria, estoque) values ("Fanta", 9, "Bebidas", 10);
insert into produto (nome, preco, categoria, estoque) values ("Pepsi", 9, "Bebidas", 10);
insert into produto (nome, preco, categoria, estoque) values ("Cerveja", 9, "Bebidas", 10);
insert into produto (nome, preco, categoria, estoque) values ("Suco Del Valle 350ml", 6.00, "Bebidas", 10);
insert into produto (nome, preco, categoria, estoque) values ("Kappo", 4.50, "Bebidas", 10);
insert into produto (nome, preco, categoria, estoque) values ("Toddynho", 3.00, "Bebidas", 10);
insert into produto (nome, preco, categoria, estoque) values ("Milk-Shake", 6.00, "Bebidas", 10);
insert into produto (nome, preco, categoria, estoque) values ("Suco Natural", 7.50, "Bebidas", 10);
insert into produto (nome, preco, categoria, estoque) values ("Chocolate Quente", 2.50, "Bebidas", 10);
insert into produto (nome, preco, categoria, estoque) values ("Água sem gás", 4.00, "Bebidas", 10);
insert into produto (nome, preco, categoria, estoque) values ("Água com gás", 5.00, "Bebidas", 10);

insert into produto (nome, preco, categoria, estoque) values ("Café Americano", 3, "Cafeteria", 10);
insert into produto (nome, preco, categoria, estoque) values ("Café Espresso", 3.5, "Cafeteria", 10);
insert into produto (nome, preco, categoria, estoque) values ("Cappuccino", 4, "Cafeteria", 10);
insert into produto (nome, preco, categoria, estoque) values ("Café Latte", 4.5, "Cafeteria", 10);
insert into produto (nome, preco, categoria, estoque) values ("Chá Quente", 3.5 , "Cafeteria", 10);
insert into produto (nome, preco, categoria, estoque) values ("Café Frappe", 4.5, "Cafeteria", 10);
insert into produto (nome, preco, categoria, estoque) values ("Mocha", 5, "Cafeteria", 10);
insert into produto (nome, preco, categoria, estoque) values ("Café Gelado", 4, "Cafeteria", 10);
insert into produto (nome, preco, categoria, estoque) values ("Café Longo", 4, "Cafeteria", 10);
insert into produto (nome, preco, categoria, estoque) values ("Cappuccino Gelado", 4.5, "Cafeteria", 10);
insert into produto (nome, preco, categoria, estoque) values ("Chocomenta", 5, "Cafeteria", 10);
insert into produto (nome, preco, categoria, estoque) values ("Oreo Cappuccino", 6, "Cafeteria", 10);
insert into produto (nome, preco, categoria, estoque) values ("Frozen Mocha", 7, "Cafeteria", 10);
insert into produto (nome, preco, categoria, estoque) values ("Frozen Latte", 7, "Cafeteria", 10);
insert into produto (nome, preco, categoria, estoque) values ("Chá Gelado", 3.5, "Cafeteria", 10);

insert into produto (nome, preco, categoria, estoque) values ("Torta de Limão", 6, "Sobremesas", 10);
insert into produto (nome, preco, categoria, estoque) values ("Torta Holandesa", 6, "Sobremesas", 10);
insert into produto (nome, preco, categoria, estoque) values ("Torta Alemã", 6, "Sobremesas", 10);
insert into produto (nome, preco, categoria, estoque) values ("Torta de Chocolate", 6, "Sobremesas", 10);
insert into produto (nome, preco, categoria, estoque) values ("Floresta Negra 100g", 5, "Sobremesas", 10);
insert into produto (nome, preco, categoria, estoque) values ("Floresta Branca 100g", 5, "Sobremesas", 10);
insert into produto (nome, preco, categoria, estoque) values ("Mousse de Chocolate", 10, "Sobremesas", 10);
insert into produto (nome, preco, categoria, estoque) values ("Merengue", 10, "Sobremesas", 10);
insert into produto (nome, preco, categoria, estoque) values ("Cannoli de Creme", 6.50, "Sobremesas", 10);
insert into produto (nome, preco, categoria, estoque) values ("Cannoli de Chocolate", 6.50, "Sobremesas", 10);
insert into produto (nome, preco, categoria, estoque) values ("Bomba de Chocolate", 5.50, "Sobremesas", 10);
insert into produto (nome, preco, categoria, estoque) values ("Bomba de Creme", 5.50, "Sobremesas", 10);
insert into produto (nome, preco, categoria, estoque) values ("Sonho Tradicional", 3.49, "Sobremesas", 10);
insert into produto (nome, preco, categoria, estoque) values ("Sonho de Creme", 3.49, "Sobremesas", 10);
insert into produto (nome, preco, categoria, estoque) values ("Quindim", 4.50, "Sobremesas", 10);

insert into produto (nome, preco, categoria, estoque) values ("Pão Francês 1Kg", 13.90, "Padaria", 10);
insert into produto (nome, preco, categoria, estoque) values ("Pão Sovado 1Kg", 14.90, "Padaria", 10);
insert into produto (nome, preco, categoria, estoque) values ("Pão de leite 1Kg", 15.30, "Padaria", 10);
insert into produto (nome, preco, categoria, estoque) values ("Ciabatta 1Kg", 29.90, "Padaria", 10);
insert into produto (nome, preco, categoria, estoque) values ("Pão Italiano 1Kg", 19.90, "Padaria", 10);
insert into produto (nome, preco, categoria, estoque) values ("Baguete 1Kg", 14.90, "Padaria", 10);
insert into produto (nome, preco, categoria, estoque) values ("Pão Salgado 1Kg", 35.90, "Padaria", 10);
insert into produto (nome, preco, categoria, estoque) values ("Brioche 1Kg", 22.90, "Padaria", 10);
insert into produto (nome, preco, categoria, estoque) values ("Copa Suíno 200g", 21.98, "Padaria", 10);
insert into produto (nome, preco, categoria, estoque) values ("Bacon Paleta 300g", 6.27, "Padaria", 10);
insert into produto (nome, preco, categoria, estoque) values ("Mortadela Ouro 200g", 4.98, "Padaria", 10);
insert into produto (nome, preco, categoria, estoque) values ("Malba 100g", 4.99, "Padaria", 10);
insert into produto (nome, preco, categoria, estoque) values ("Mortela Mista 400g", 4.79, "Padaria", 10);
insert into produto (nome, preco, categoria, estoque) values ("Queijo Ralado 200g", 3.99, "Padaria", 10);
insert into produto (nome, preco, categoria, estoque) values ("Queijo de Cabra 200g", 41.80, "Padaria", 10);

insert into produto (nome, preco, categoria, estoque) values ("Alface 1 Und", 0.89, "Outros", 10);
insert into produto (nome, preco, categoria, estoque) values ("Tomate 1Kg", 2.59, "Outros", 10);
insert into produto (nome, preco, categoria, estoque) values ("Banana 1Kg", 2.99, "Outros", 10);
insert into produto (nome, preco, categoria, estoque) values ("Mamão 1Kg", 1.99, "Outros", 10);
insert into produto (nome, preco, categoria, estoque) values ("Cebola 1Kg", 1.99, "Outros", 10);
insert into produto (nome, preco, categoria, estoque) values ("Cheiro Verde 1 Und", 0.75, "Outros", 10);
insert into produto (nome, preco, categoria, estoque) values ("Cenoura 1Kg", 1.49, "Outros", 10);
insert into produto (nome, preco, categoria, estoque) values ("Pepino 1Kg", 1.69, "Outros", 10);
insert into produto (nome, preco, categoria, estoque) values ("Laranja 1Kg", 1.99, "Outros", 10);
insert into produto (nome, preco, categoria, estoque) values ("Abacaxi 1Kg", 3.49, "Outros", 10);
insert into produto (nome, preco, categoria, estoque) values ("Melão 1Kg", 1.99, "Outros", 10);
insert into produto (nome, preco, categoria, estoque) values ("Beterraba 1Kg", 2.99, "Outros", 10);
insert into produto (nome, preco, categoria, estoque) values ("Chuchu 1Kg", 0.99, "Outros", 10);
insert into produto (nome, preco, categoria, estoque) values ("Pimentão Verde 1Kg", 2.39, "Outros", 10);
insert into produto (nome, preco, categoria, estoque) values ("Pimentão Amarelo 1Kg", 2.29, "Outros", 10);


select * from empregado;
select * from produto;
select * from cliente;
select * from pedido;