CREATE SCHEMA IF NOT EXISTS C207 DEFAULT CHARACTER SET utf8 ;
USE C207;

-- -----------------------------------------------------
-- Table `mydb`.`Produto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS C207.`Produto` (
  `idProduto` INT NOT NULL,
  `nome` VARCHAR(45) NOT NULL,
  `marca` VARCHAR(45) NOT NULL,
  `tipo` VARCHAR(45) NOT NULL,
  `preco` DOUBLE NOT NULL,
  `qntDisponivel` INT NOT NULL,
  PRIMARY KEY (`idProduto`));



-- -----------------------------------------------------
-- Table `mydb`.`Loja`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Loja` (
  `idLoja` INT NOT NULL,
  `nome` VARCHAR(45) NOT NULL,
  `endereco` VARCHAR(45) NOT NULL,
  `telefone` VARCHAR(45) NOT NULL,
  `email` VARCHAR(45) NULL,
  PRIMARY KEY (`idLoja`));



-- -----------------------------------------------------
-- Table `mydb`.`Produto_has_Loja`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Produto_has_Loja` (
  `Produto_idProduto` INT NOT NULL,
  `Loja_idLoja` INT NOT NULL,
  PRIMARY KEY (`Produto_idProduto`, `Loja_idLoja`),
  INDEX `fk_Produto_has_Loja_Loja1_idx` (`Loja_idLoja` ASC) VISIBLE,
  INDEX `fk_Produto_has_Loja_Produto_idx` (`Produto_idProduto` ASC) VISIBLE,
  CONSTRAINT `fk_Produto_has_Loja_Produto`
    FOREIGN KEY (`Produto_idProduto`)
    REFERENCES `mydb`.`Produto` (`idProduto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Produto_has_Loja_Loja1`
    FOREIGN KEY (`Loja_idLoja`)
    REFERENCES `mydb`.`Loja` (`idLoja`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

-- -----------------------------------------------------
-- Table `mydb`.`Cliente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Cliente` (
  `cpf` INT NOT NULL,
  `nome` VARCHAR(45) NOT NULL,
  `cep` VARCHAR(45) NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  `senha` VARCHAR(45) NOT NULL,
  `telefone` VARCHAR(45) NULL,
  PRIMARY KEY (`cpf`));


-- -----------------------------------------------------
-- Table `mydb`.`Correio`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Correio` (
  `idCorreio` INT NOT NULL,
  `prazo` INT NOT NULL,
  `frete` DOUBLE NOT NULL,
  PRIMARY KEY (`idCorreio`));


-- -----------------------------------------------------
-- Table `mydb`.`Compra`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Compra` (
  `codRastreamento` INT NOT NULL,
  `valorTotal` DOUBLE NOT NULL,
  `pagamento` VARCHAR(45) NOT NULL,
  `Cliente_cpf` INT NOT NULL,
  `Correio_idCorreio` INT NOT NULL,
  PRIMARY KEY (`codRastreamento`, `Cliente_cpf`, `Correio_idCorreio`),
  CONSTRAINT `fk_Compra_Cliente1`
    FOREIGN KEY (`Cliente_cpf`)
    REFERENCES `mydb`.`Cliente` (`cpf`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Compra_Correio1`
    FOREIGN KEY (`Correio_idCorreio`)
    REFERENCES `mydb`.`Correio` (`idCorreio`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


-- -----------------------------------------------------
-- Table `mydb`.`Produto_has_Compra`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Produto_has_Compra` (
  `Produto_idProduto` INT NOT NULL,
  `Compra_codRastreamento` INT NOT NULL,
  `Compra_Cliente_cpf` INT NOT NULL,
  `Compra_Correio_idCorreio` INT NOT NULL,
  PRIMARY KEY (`Produto_idProduto`, `Compra_codRastreamento`, `Compra_Cliente_cpf`, `Compra_Correio_idCorreio`),
  CONSTRAINT `fk_Produto_has_Compra_Produto1`
    FOREIGN KEY (`Produto_idProduto`)
    REFERENCES `mydb`.`Produto` (`idProduto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Produto_has_Compra_Compra1`
    FOREIGN KEY (`Compra_codRastreamento` , `Compra_Cliente_cpf` , `Compra_Correio_idCorreio`)
    REFERENCES `mydb`.`Compra` (`codRastreamento` , `Cliente_cpf` , `Correio_idCorreio`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);
