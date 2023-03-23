USE test;

CREATE TABLE countries (
  name_ VARCHAR(30),
  iso_code VARCHAR(3),
  PRIMARY KEY (iso_code)
);

CREATE TABLE population (
  year_ INT,
  amount INT,
  iso_code VARCHAR(3),
  FOREIGN KEY (iso_code) REFERENCES countries(iso_code)  
);

CREATE TABLE energy (
  year_ INT,
  clean_energy INT,
  dirty_energy INT,
  co2_emission INT,
  iso_code VARCHAR(3),
  FOREIGN KEY (iso_code) REFERENCES countries(iso_code)
);

CREATE TABLE have_relationship (
  iso_code VARCHAR(3),
  year_ INT,
  amount INT,
  PRIMARY KEY (year_),
  FOREIGN KEY (iso_code) REFERENCES countries(iso_code) ON UPDATE CASCADE
);

CREATE TABLE consumer_relationship (
  iso_code VARCHAR(3),
  year_ INT,
  clean_energy INT,
  dirty_energy INT,
  co2_emission INT,
  PRIMARY KEY (year_),
  FOREIGN KEY (iso_code) REFERENCES countries(iso_code) ON UPDATE CASCADE
  
);
