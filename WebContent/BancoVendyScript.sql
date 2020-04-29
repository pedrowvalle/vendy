drop database if exists vendy;
create database vendy;
use vendy;
/*comÃ©rcio (nome, cnpj, endereco, telefone)*/
create table comercio (nome varchar(20) not null, cnpj varchar(20) not null, endereco varchar(50), telefone varchar(10), primary key (cnpj));
/*empregado (CPF, sexo, dt_nsc, nome, cnpj_comercio)*/
create table empregado (cpf varchar(10) not null, genero smallint, dt_nsc varchar(10), nome varchar(20) not null, cnpj_comercio varchar(20), usuario varchar(20), senha varchar(20), tipo smallint, primary key (cpf));
/*estoqusta(cpf_emp, cod)*/
create table estoquista (cpf_emp varchar(10) not null, cod int, primary key (cod));
/*operador (cpf_emp, cod)*/
create table operador (cpf_emp varchar(10) not null, cod int, primary key (cod));
/*produto (cod, nome, preco, categoria)*/
create table produto (cod int not null auto_increment, nome varchar(20), preco double, categoria varchar(15), estoque int, primary key(cod));
/*pedido (cod, cod_produto, data, preco, cod_operador, cpf_cliente)*/
create table pedido (cod int not null, cod_produto int, data_pedido date, preco decimal, cod_operador int not null, cpf_cliente varchar(10), primary key(cod));
/*cliente (CPF, nome, dt_nsc, sexo)*/
create table cliente (cpf varchar(10) not null, nome varchar (20), dt_nsc varchar(10), genero char, primary key(cpf));
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
  
/*adicionar fks em pedido*/
ALTER TABLE `vendy`.`pedido` 
ADD INDEX `cod_prod_idx` (`cod_produto` ASC),
ADD INDEX `cod_operador_idx` (`cod_operador` ASC),
ADD INDEX `cpf_cliente_idx` (`cpf_cliente` ASC);
ALTER TABLE `vendy`.`pedido` 
ADD CONSTRAINT `cod_prod`
  FOREIGN KEY (`cod_produto`)
  REFERENCES `vendy`.`produto` (`cod`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION,
ADD CONSTRAINT `cod_operador`
  FOREIGN KEY (`cod_operador`)
  REFERENCES `vendy`.`operador` (`cod`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION,
ADD CONSTRAINT `cpf_cliente`
  FOREIGN KEY (`cpf_cliente`)
  REFERENCES `vendy`.`cliente` (`cpf`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;
  
insert into comercio (nome, cnpj, endereco, telefone) values ("seu zé", "0123456789", "Rua dos bobos, 0", "0116587852");
insert into empregado (cpf, genero, dt_nsc, nome, cnpj_comercio, usuario, senha, tipo) values ("40305550", 1, '30/05/1991', "Pedro", "0123456789", "pedro", "0123", 1);
insert into empregado (cpf, genero, dt_nsc, nome, cnpj_comercio, usuario, senha, tipo) values ("11122233", 1, '10/07/2001', "Caio", "0123456789", "caio", "0123", 2);

select * from produto;
select * from empregado;

insert into produto (nome, preco, categoria, estoque) values ("Coca-cola 350ml", '2.05', "Bebidas", 10);
insert into produto(nome, preco, categoria, estoque)values ("Coca-cola 1,5l", 5.49, "Bebidas", 10);
insert into produto (nome, preco, categoria, estoque) values ("Coca-cola 2l", 6.49, "Bebidas", 10);
insert into produto (nome, preco, categoria, estoque) values ("Arroz 5kg", 14, "Alimentos", 10);
insert into produto (nome, preco, categoria, estoque) values ("Feijão 1kg", 8, "Alimentos", 10);
insert into produto (nome, preco, categoria, estoque) values ("Molho  600ml", 9, "Alimentos", 10);
insert into produto (nome, preco, categoria, estoque) values ("Guaraná", 9, "Bebidas", 10);
insert into produto (nome, preco, categoria, estoque) values ("Fanta", 9, "Bebidas", 10);
insert into produto (nome, preco, categoria, estoque) values ("Pepsi", 9, "Bebidas", 10);
insert into produto (nome, preco, categoria, estoque) values ("Cerveja", 9, "Bebidas", 10);
insert into produto (nome, preco, categoria, estoque) values ("Bolacha", 9, "Alimentos", 10);
insert into produto (nome, preco, categoria, estoque) values ("Farinha", 9, "Alimentos", 10);
insert into produto (nome, preco, categoria, estoque) values ("Amaciante", 9, "Outros", 10);
insert into produto (nome, preco, categoria, estoque) values ("Sabão em pó", 9, "Outros", 10);
insert into produto (nome, preco, categoria, estoque) values ("Vassoura", 9, "Outros", 10);
insert into produto (nome, preco, categoria, estoque) values ("Ingresso HopiHari", 9, "Outros", 10);
insert into produto (nome, preco, categoria, estoque) values ("Espeto Churrasco", 9, "Outros", 10);


  delete from empregado where cpf=40305550;