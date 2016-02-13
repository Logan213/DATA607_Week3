DROP TABLE IF EXISTS tb;

CREATE TABLE tb 
(
  country varchar(100) NOT NULL,
  year int NOT NULL,
  sex varchar(6) NOT NULL,
  child int NULL,
  adult int NULL,
  elderly int NULL
);

SELECT * FROM tb;

# download tb.csv from Blackboard and change file location as appropriate

LOAD DATA INFILE '/Users/Shared/tb.csv' 
INTO TABLE tb
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
(country, year, sex, @child, @adult, @elderly)
SET
child = nullif(@child,-1),
adult = nullif(@adult,-1),
elderly = nullif(@elderly,-1)
;

DROP TABLE IF EXISTS population;

CREATE TABLE population 
(
  country varchar(100) NOT NULL,
  year int NOT NULL,
  population int NOT NULL
);

SELECT * FROM population;

# download population.csv from Blackboard and change file location as appropriate

LOAD DATA INFILE '/Users/Shared/population.csv' 
INTO TABLE population
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
;