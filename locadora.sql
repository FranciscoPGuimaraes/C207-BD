CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`Cliente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Cliente` (
  `idCliente` INT NOT NULL,
  `PreNome` VARCHAR(45) NOT NULL,
  `SobreNome` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idCliente`));


-- -----------------------------------------------------
-- Table `mydb`.`Telefone`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Telefone` (
  `idTelefone` INT NOT NULL,
  `telefone` VARCHAR(45) NOT NULL,
  `Cliente_idCliente` INT NOT NULL,
  PRIMARY KEY (`Cliente_idCliente`, `idTelefone`),
  CONSTRAINT `fk_Telefone_Cliente`
    FOREIGN KEY (`Cliente_idCliente`)
    REFERENCES `mydb`.`Cliente` (`idCliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


-- -----------------------------------------------------
-- Table `mydb`.`Categoria`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Categoria` (
  `idCategoria` INT NOT NULL,
  `nome` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idCategoria`));


-- -----------------------------------------------------
-- Table `mydb`.`Filme`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Filme` (
  `idFilme` INT NOT NULL,
  `titulo` VARCHAR(45) NOT NULL,
  `Categoria_idCategoria` INT NOT NULL,
  PRIMARY KEY (`idFilme`, `Categoria_idCategoria`),
  CONSTRAINT `fk_Filme_Categoria1`
    FOREIGN KEY (`Categoria_idCategoria`)
    REFERENCES `mydb`.`Categoria` (`idCategoria`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


-- -----------------------------------------------------
-- Table `mydb`.`DVD`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`DVD` (
  `idDVD` INT NOT NULL,
  `Cliente_idCliente` INT NOT NULL,
  `Filme_idFilme` INT NOT NULL,
  PRIMARY KEY (`idDVD`),
  CONSTRAINT `fk_DVD_Cliente1`
    FOREIGN KEY (`Cliente_idCliente`)
    REFERENCES `mydb`.`Cliente` (`idCliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_DVD_Filme1`
    FOREIGN KEY (`Filme_idFilme`)
    REFERENCES `mydb`.`Filme` (`idFilme`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


-- -----------------------------------------------------
-- Table `mydb`.`Ator`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Ator` (
  `idAtor` INT NOT NULL,
  `nome` VARCHAR(45) NOT NULL,
  `dataNasc` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idAtor`));


-- -----------------------------------------------------
-- Table `mydb`.`Ator_has_Filme`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Ator_has_Filme` (
  `Ator_idAtor` INT NOT NULL,
  `Filme_idFilme` INT NOT NULL,
  PRIMARY KEY (`Ator_idAtor`, `Filme_idFilme`),
  CONSTRAINT `fk_Ator_has_Filme_Ator1`
    FOREIGN KEY (`Ator_idAtor`)
    REFERENCES `mydb`.`Ator` (`idAtor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Ator_has_Filme_Filme1`
    FOREIGN KEY (`Filme_idFilme`)
    REFERENCES `mydb`.`Filme` (`idFilme`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

