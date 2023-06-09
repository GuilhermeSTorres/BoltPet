-- MySQL Script generated by MySQL Workbench
-- Sun Jun 11 21:09:59 2023
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`Pagamento`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Pagamento` (
  `id_pagamento` INT NOT NULL,
  `tipo_pagamento` VARCHAR(45) NOT NULL,
  UNIQUE INDEX `id_pagamento_UNIQUE` (`id_pagamento` ASC) VISIBLE,
  PRIMARY KEY (`id_pagamento`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Assinatura`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Assinatura` (
  `id_assinatura` INT NOT NULL,
  `tipo_assinatura` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_assinatura`),
  UNIQUE INDEX `id_assinatura_UNIQUE` (`id_assinatura` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Endereço`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Endereço` (
  `id_endereco` INT NOT NULL,
  `cep` VARCHAR(45) NOT NULL,
  `tipo_logradouro` VARCHAR(45) NOT NULL,
  `logradouro` VARCHAR(45) NOT NULL,
  `bairro` VARCHAR(45) NOT NULL,
  `cidade` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_endereco`),
  UNIQUE INDEX `id_endereco_UNIQUE` (`id_endereco` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Cliente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Cliente` (
  `id_cliente` INT NOT NULL,
  `id_endereco` INT NOT NULL,
  `id_assinatura` INT NOT NULL,
  `id_pagamento` INT NOT NULL,
  `nome` VARCHAR(45) NOT NULL,
  `sobrenome` VARCHAR(45) NOT NULL,
  `cpf` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_cliente`),
  UNIQUE INDEX `id_cliente_UNIQUE` (`id_cliente` ASC) VISIBLE,
  UNIQUE INDEX `cpf_UNIQUE` (`cpf` ASC) VISIBLE,
  INDEX `fk_Cliente_Pagamento_idx` (`id_pagamento` ASC) VISIBLE,
  INDEX `fk_Cliente_Assinatura1_idx` (`id_assinatura` ASC) VISIBLE,
  INDEX `fk_Cliente_Endereço1_idx` (`id_endereco` ASC) VISIBLE,
  CONSTRAINT `fk_Cliente_Pagamento`
    FOREIGN KEY (`id_pagamento`)
    REFERENCES `mydb`.`Pagamento` (`id_pagamento`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Cliente_Assinatura1`
    FOREIGN KEY (`id_assinatura`)
    REFERENCES `mydb`.`Assinatura` (`id_assinatura`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Cliente_Endereço1`
    FOREIGN KEY (`id_endereco`)
    REFERENCES `mydb`.`Endereço` (`id_endereco`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Caixa`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Caixa` (
  `id_caixa` INT NOT NULL,
  `vendas` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_caixa`),
  UNIQUE INDEX `id_caixa_UNIQUE` (`id_caixa` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Funcionário`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Funcionário` (
  `id_funcionario` INT NOT NULL,
  `id_cliente` INT NOT NULL,
  `id_caixa` INT NOT NULL,
  `nome` VARCHAR(45) NOT NULL,
  `sobrenome` VARCHAR(45) NOT NULL,
  `cpf` VARCHAR(45) NOT NULL,
  `idade` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_funcionario`, `id_cliente`),
  UNIQUE INDEX `id_funcionario_UNIQUE` (`id_funcionario` ASC) VISIBLE,
  UNIQUE INDEX `cpf_UNIQUE` (`cpf` ASC) VISIBLE,
  INDEX `fk_Funcionário_Cliente1_idx` (`id_cliente` ASC) VISIBLE,
  INDEX `fk_Funcionário_Caixa1_idx` (`id_caixa` ASC) VISIBLE,
  CONSTRAINT `fk_Funcionário_Cliente1`
    FOREIGN KEY (`id_cliente`)
    REFERENCES `mydb`.`Cliente` (`id_cliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Funcionário_Caixa1`
    FOREIGN KEY (`id_caixa`)
    REFERENCES `mydb`.`Caixa` (`id_caixa`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Pet`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Pet` (
  `id_pet` INT NOT NULL,
  `nome` VARCHAR(45) NOT NULL,
  `idade` VARCHAR(45) NOT NULL,
  `descricao` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_pet`),
  UNIQUE INDEX `id_pet_UNIQUE` (`id_pet` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Compra`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Compra` (
  `id_compra` INT NOT NULL,
  `carrinho` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_compra`),
  UNIQUE INDEX `id_compra_UNIQUE` (`id_compra` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Cliente_faz_Compra`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Cliente_faz_Compra` (
  `Cliente_id_cliente` INT NOT NULL,
  `Compra_id_compra` INT NOT NULL,
  `data_compra` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`Cliente_id_cliente`, `Compra_id_compra`),
  INDEX `fk_Cliente_has_Compra_Compra1_idx` (`Compra_id_compra` ASC) VISIBLE,
  INDEX `fk_Cliente_has_Compra_Cliente1_idx` (`Cliente_id_cliente` ASC) VISIBLE,
  CONSTRAINT `fk_Cliente_has_Compra_Cliente1`
    FOREIGN KEY (`Cliente_id_cliente`)
    REFERENCES `mydb`.`Cliente` (`id_cliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Cliente_has_Compra_Compra1`
    FOREIGN KEY (`Compra_id_compra`)
    REFERENCES `mydb`.`Compra` (`id_compra`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Cliente_tem_Pet`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Cliente_tem_Pet` (
  `Cliente_id_cliente` INT NOT NULL,
  `Pet_id_pet` INT NOT NULL,
  `dados` VARCHAR(45) NOT NULL,
  `alterar dados` VARCHAR(45) NULL,
  `dia_cadastro` DATE NOT NULL,
  PRIMARY KEY (`Cliente_id_cliente`, `Pet_id_pet`),
  INDEX `fk_Cliente_has_Pet_Pet1_idx` (`Pet_id_pet` ASC) VISIBLE,
  INDEX `fk_Cliente_has_Pet_Cliente1_idx` (`Cliente_id_cliente` ASC) VISIBLE,
  CONSTRAINT `fk_Cliente_has_Pet_Cliente1`
    FOREIGN KEY (`Cliente_id_cliente`)
    REFERENCES `mydb`.`Cliente` (`id_cliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Cliente_has_Pet_Pet1`
    FOREIGN KEY (`Pet_id_pet`)
    REFERENCES `mydb`.`Pet` (`id_pet`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Tratamento`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Tratamento` (
  `id_tratamento` INT NOT NULL,
  `id_funcionario` INT NOT NULL,
  `id_cliente` INT NOT NULL,
  `banho` VARCHAR(45) NOT NULL,
  `tosa` VARCHAR(45) NOT NULL,
  `vacinacao` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_tratamento`),
  UNIQUE INDEX `id_tratamento_UNIQUE` (`id_tratamento` ASC) VISIBLE,
  INDEX `fk_Tratamento_Funcionário1_idx` (`id_funcionario` ASC, `id_cliente` ASC) VISIBLE,
  CONSTRAINT `fk_Tratamento_Funcionário1`
    FOREIGN KEY (`id_funcionario` , `id_cliente`)
    REFERENCES `mydb`.`Funcionário` (`id_funcionario` , `id_cliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Pet_tem_Tratamento`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Pet_tem_Tratamento` (
  `id_pet` INT NOT NULL,
  `id_tratamento` INT NOT NULL,
  `data_tratamento` DATE NOT NULL,
  `busca_pet` VARCHAR(45) NOT NULL,
  `entrega_pet` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_pet`, `id_tratamento`),
  INDEX `fk_Pet_has_Tratamento_Tratamento1_idx` (`id_tratamento` ASC) VISIBLE,
  INDEX `fk_Pet_has_Tratamento_Pet1_idx` (`id_pet` ASC) VISIBLE,
  CONSTRAINT `fk_Pet_has_Tratamento_Pet1`
    FOREIGN KEY (`id_pet`)
    REFERENCES `mydb`.`Pet` (`id_pet`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Pet_has_Tratamento_Tratamento1`
    FOREIGN KEY (`id_tratamento`)
    REFERENCES `mydb`.`Tratamento` (`id_tratamento`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Loja`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Loja` (
  `id_loja` INT NOT NULL,
  `id_compra` INT NOT NULL,
  `nome` VARCHAR(45) NOT NULL,
  `endereco` VARCHAR(45) NOT NULL,
  `produtos` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_loja`),
  INDEX `fk_Loja_Compra1_idx` (`id_compra` ASC) VISIBLE,
  CONSTRAINT `fk_Loja_Compra1`
    FOREIGN KEY (`id_compra`)
    REFERENCES `mydb`.`Compra` (`id_compra`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Relatório`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Relatório` (
  `id_relatorio` INT NOT NULL,
  `data_relatorio` DATE NOT NULL,
  `Compra_id_compra` INT NOT NULL,
  `Caixa_id_caixa` INT NOT NULL,
  PRIMARY KEY (`id_relatorio`),
  UNIQUE INDEX `id_relatorio_UNIQUE` (`id_relatorio` ASC) VISIBLE,
  INDEX `fk_Relatório_Compra1_idx` (`Compra_id_compra` ASC) VISIBLE,
  INDEX `fk_Relatório_Caixa1_idx` (`Caixa_id_caixa` ASC) VISIBLE,
  CONSTRAINT `fk_Relatório_Compra1`
    FOREIGN KEY (`Compra_id_compra`)
    REFERENCES `mydb`.`Compra` (`id_compra`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Relatório_Caixa1`
    FOREIGN KEY (`Caixa_id_caixa`)
    REFERENCES `mydb`.`Caixa` (`id_caixa`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
