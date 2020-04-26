create database vendy;
use vendy;
/*comércio (nome, cnpj, endereco, telefone)*/
create table comercio (nome varchar(20) not null, cnpj varchar(20) not null, endereco varchar(50), telefone varchar(10), primary key (cnpj));
/*empregado (CPF, sexo, dt_nsc, nome, cnpj_comercio)*/
create table empregado (cpf varchar(10) not null, genero varchar(1), dt_nsc varchar(10), nome varchar(20) not null, cnpj_comercio varchar(20), usuario varchar(20), senha varchar(20), tipo smallint, primary key (cpf));
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

select * from cliente;
select * from produto;
select * from empregado;

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