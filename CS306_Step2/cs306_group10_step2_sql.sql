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
  iso_code VARCHAR(3),  
  FOREIGN KEY (iso_code) REFERENCES countries(iso_code)
);

ALTER TABLE energy
ADD COLUMN total_energy INT;

UPDATE energy
SET total_energy = dirty_energy + clean_energy
WHERE iso_code IS NOT NULL;

CREATE TABLE have_relationship (
  iso_code VARCHAR(3),
  year_ INT,
  amount INT,
  PRIMARY KEY (year_, iso_code),
  FOREIGN KEY (iso_code) REFERENCES countries(iso_code)
);

CREATE TABLE consumer_relationship (
  iso_code VARCHAR(3),
  year_ INT,
  clean_energy INT,
  dirty_energy INT,
  co2_emission INT,
  PRIMARY KEY (year_, iso_code),
  FOREIGN KEY (iso_code) REFERENCES countries(iso_code) ON UPDATE CASCADE  
);

CREATE TABLE pollution (
    year_ INT,
    ozone_density FLOAT,
    temperature_anomaly FLOAT 
);



CREATE TABLE world_total AS
    SELECT energy.total_energy, pollution.ozone_density, pollution.temperature_anomaly
    FROM energy
    JOIN pollution ON energy.year_ = pollution.year_;
