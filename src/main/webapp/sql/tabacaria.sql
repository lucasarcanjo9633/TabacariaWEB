create database tabacaria;
use tabacaria;
CREATE TABLE `produto` (
`id` INT(11) NOT NULL AUTO_INCREMENT,
`status` BOOLEAN NOT NULL DEFAULT true,
`nome` VARCHAR(100) NOT NULL,
`descricao` VARCHAR(100) NULL DEFAULT NULL,
`palavra_chave` VARCHAR(100) NOT NULL,
`img` VARCHAR(50) NOT NULL,
PRIMARY KEY (`id`));

CREATE TABLE `entrada_produto` (
`id` INT(11) NOT NULL AUTO_INCREMENT,
`id_produto` INT(11) NULL DEFAULT NULL,
`qtde` INT(11) NULL DEFAULT NULL,
`valor_venda` DECIMAL(9,2) NULL DEFAULT '0.00',
`data_entrada` DATE NULL DEFAULT NULL,
PRIMARY KEY (`id`));

CREATE TABLE `estoque` (
`id` INT(11) NOT NULL AUTO_INCREMENT,
`id_produto` INT(11) NULL DEFAULT NULL,
`qtde` INT(11) NULL DEFAULT NULL,
`valor_venda` DECIMAL(9,2) NULL DEFAULT '0.00',
PRIMARY KEY (`id`));

CREATE TABLE `saida_produto` (
`id` INT(11) NOT NULL AUTO_INCREMENT,
`id_venda` int(11) NOT NULL,
`id_produto` INT(11) NULL DEFAULT NULL,
`qtde` INT(11) NULL DEFAULT NULL,
`data_saida` DATE NULL DEFAULT NULL,
`valor_venda` DECIMAL(9,2) NULL DEFAULT '0.00',
PRIMARY KEY (`id`));

DELIMITER //
  CREATE PROCEDURE `SP_AtualizaEstoque`( id_prod int, qtde_comprada int, valor_vend decimal(9,2))
BEGIN
    declare contador int(11);
 
    SELECT count(*) into contador FROM estoque WHERE id_produto = id_prod;
 
    IF contador > 0 THEN
        UPDATE estoque SET qtde=qtde + qtde_comprada, valor_venda= valor_vend
        WHERE id_produto = id_prod;
    ELSE
        INSERT INTO estoque (id_produto, qtde, valor_venda) values (id_prod, qtde_comprada, valor_vend);
    END IF;
END //
DELIMITER ;

DELIMITER //
CREATE TRIGGER `TRG_EntradaProduto_AI` AFTER INSERT ON `entrada_produto`
FOR EACH ROW
BEGIN
      CALL SP_AtualizaEstoque (new.id_produto, new.qtde, new.valor_venda);
END //
DELIMITER ;

DELIMITER //
CREATE TRIGGER `TRG_EntradaProduto_AU` AFTER UPDATE ON `entrada_produto`
FOR EACH ROW
BEGIN
      CALL SP_AtualizaEstoque (new.id_produto, new.qtde - old.qtde, new.valor_venda);
END //
DELIMITER ;

DELIMITER //
CREATE TRIGGER `TRG_EntradaProduto_AD` AFTER DELETE ON `entrada_produto`
FOR EACH ROW
BEGIN
      CALL SP_AtualizaEstoque (old.id_produto, old.qtde * -1, old.valor_venda);
END //
DELIMITER ;

DELIMITER //
CREATE TRIGGER `TRG_SaidaProduto_AI` AFTER INSERT ON `saida_produto`
FOR EACH ROW
BEGIN
      CALL SP_AtualizaEstoque (new.id_produto, new.qtde * -1, new.valor_venda);
END //
DELIMITER ;

DELIMITER //
CREATE TRIGGER `TRG_SaidaProduto_AD` AFTER DELETE ON `saida_produto`
FOR EACH ROW
BEGIN
      CALL SP_AtualizaEstoque (old.id_produto, old.qtde, old.valor_venda);
END //
DELIMITER ;