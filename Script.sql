--- creating a schema ---
CREATE schema carolina_graciolli_siqueira authorization rgcngfnw;

--- table MODELS ---
CREATE TABLE carolina_graciolli_siqueira.models(
				id_model integer NOT NULL, -- PK
				id_brand integer NOT NULL, -- FK -> brands
				model varchar(30) NOT NULL
				);

ALTER TABLE carolina_graciolli_siqueira.models
	ADD CONSTRAINT pk_model PRIMARY KEY (id_model);

--- table BRANDS ---
CREATE TABLE carolina_graciolli_siqueira.brands(
				id_brand integer NOT NULL, -- PK
				id_company integer NOT NULL, -- FK -> companies
				brand varchar(30) NOT NULL
				);

ALTER TABLE carolina_graciolli_siqueira.brands
	ADD CONSTRAINT pk_brand PRIMARY KEY (id_brand);

--- table COMPANIES ---
CREATE TABLE carolina_graciolli_siqueira.companies(
				id_company integer NOT NULL, -- PK
				company varchar(30) NOT NULL
				);

ALTER TABLE carolina_graciolli_siqueira.companies
	ADD CONSTRAINT pk_company PRIMARY KEY (id_company);

-- table INSURANCES ---
CREATE TABLE carolina_graciolli_siqueira.insurances(
				id_insurance integer NOT NULL, -- PK
				id_car integer NOT NULL, --FK -> car
				id_insurance_company integer NOT NULL, --FK -> insurance_companies
				insurance_number integer NOT NULL
				);

ALTER TABLE carolina_graciolli_siqueira.insurances
	ADD CONSTRAINT pk_insurance PRIMARY KEY (id_insurance);

--- table INSURANCE_COMPANIES ---
CREATE TABLE carolina_graciolli_siqueira.insurance_companies(
				id_insurance_company integer NOT NULL, -- PK
				insurance_company varchar(50) NOT NULL
				);

ALTER TABLE carolina_graciolli_siqueira.insurance_companies
	ADD CONSTRAINT pk_insurance_company PRIMARY KEY (id_insurance_company);

--- table CURRENCIES ---
CREATE TABLE carolina_graciolli_siqueira.currencies(
				id_currency integer NOT NULL, -- PK
				currency varchar(30) NOT NULL,
				region varchar(30) NULL
				);

ALTER TABLE carolina_graciolli_siqueira.currencies
	ADD CONSTRAINT pk_currency PRIMARY KEY (id_currency);

--- table INSPECTIONS ---
CREATE TABLE carolina_graciolli_siqueira.inspections(
				km integer NOT NULL, 
				id_car integer NOT NULL, --PK, FK --> cars
				id_currency integer NOT NULL default '001', --FK --> currencies
				inspection_date timestamp NOT NULL, --PK
				price integer NOT NULL
				);

ALTER TABLE carolina_graciolli_siqueira.inspections
	ADD CONSTRAINT pk_inspection PRIMARY KEY (inspection_date, id_car);

--- table COLORS ---
CREATE TABLE carolina_graciolli_siqueira.colors(
				id_color integer NOT NULL, -- PK
				color varchar(20) NOT NULL
				);

ALTER TABLE carolina_graciolli_siqueira.colors
	ADD CONSTRAINT pk_color PRIMARY KEY (id_color);

--- table CARS ---
CREATE TABLE carolina_graciolli_siqueira.cars(
				id_car integer NOT NULL, -- PK
				id_model integer NOT NULL, -- FK  --> models
				id_color integer NOT NULL, -- FK --> colors
				date_of_purchase date NOT NULL,
				license_plate varchar(10) NOT NULL,
				km_total integer NOT NULL
				);
			
ALTER TABLE carolina_graciolli_siqueira.cars
	ADD CONSTRAINT pk_car PRIMARY KEY (id_car);

--- FK---
ALTER TABLE carolina_graciolli_siqueira.brands
	ADD CONSTRAINT brand_company FOREIGN KEY (id_company)
	REFERENCES carolina_graciolli_siqueira.companies (id_company);

ALTER TABLE carolina_graciolli_siqueira.models
	ADD CONSTRAINT model_brand FOREIGN KEY (id_brand)
	REFERENCES carolina_graciolli_siqueira.brands (id_brand);

ALTER TABLE carolina_graciolli_siqueira.insurances
	ADD CONSTRAINT which_company FOREIGN KEY (id_insurance_company)
	REFERENCES carolina_graciolli_siqueira.insurance_companies (id_insurance_company);

ALTER TABLE carolina_graciolli_siqueira.insurances
	ADD CONSTRAINT car FOREIGN KEY (id_car)
	REFERENCES carolina_graciolli_siqueira.cars (id_car);

ALTER TABLE carolina_graciolli_siqueira.cars
	ADD CONSTRAINT type_model FOREIGN KEY (id_model)
	REFERENCES carolina_graciolli_siqueira.models (id_model);

ALTER TABLE carolina_graciolli_siqueira.cars
	ADD CONSTRAINT car_color FOREIGN KEY (id_color)
	REFERENCES carolina_graciolli_siqueira.colors (id_color);

ALTER TABLE carolina_graciolli_siqueira.inspections
	ADD CONSTRAINT inspection_car FOREIGN KEY (id_car)
	REFERENCES carolina_graciolli_siqueira.cars(id_car);

ALTER TABLE carolina_graciolli_siqueira.inspections
	ADD CONSTRAINT type_currency FOREIGN KEY (id_currency)
	REFERENCES carolina_graciolli_siqueira.currencies(id_currency);

-----------
--- DML ---
-----------

--- currencies ---
INSERT INTO carolina_graciolli_siqueira.currencies
	(id_currency, currency, region)
	VALUES('001', 'euro', 'EU');

INSERT INTO carolina_graciolli_siqueira.currencies
	(id_currency, currency, region)
	VALUES('002', 'dolar', 'USA');

INSERT INTO carolina_graciolli_siqueira.currencies
	(id_currency, currency, region)
	VALUES('003', 'pound', 'UK');

--- companies ---
INSERT INTO carolina_graciolli_siqueira.companies
	(id_company, company)
	VALUES('001', 'RNMA');

INSERT INTO carolina_graciolli_siqueira.companies
	(id_company, company)
	VALUES('002', 'FCA');

--- brands ---
INSERT INTO carolina_graciolli_siqueira.brands
	(id_brand, id_company, brand)
	VALUES('001', '001', 'Renault');

INSERT INTO carolina_graciolli_siqueira.brands
	(id_brand, id_company, brand)
	VALUES('002', '001', 'Nissan');

INSERT INTO carolina_graciolli_siqueira.brands
	(id_brand, id_company, brand)
	VALUES('003', '002', 'Fiat');

--- models ---
INSERT INTO carolina_graciolli_siqueira.models
	(id_model, id_brand, model)
	VALUES('001', '001', 'Scenic');

INSERT INTO carolina_graciolli_siqueira.models
	(id_model, id_brand, model)
	VALUES('002', '002', 'NOTE');

INSERT INTO carolina_graciolli_siqueira.models
	(id_model, id_brand, model)
	VALUES('003', '002', 'X-TRAIL');

INSERT INTO carolina_graciolli_siqueira.models
	(id_model, id_brand, model)
	VALUES('004', '003', 'Panda');

INSERT INTO carolina_graciolli_siqueira.models
	(id_model, id_brand, model)
	VALUES('005', '003', '500L');

INSERT INTO carolina_graciolli_siqueira.models
	(id_model, id_brand, model)
	VALUES('006', '003', '500X');

--- insurance_companies ---
INSERT INTO carolina_graciolli_siqueira.insurance_companies
	(id_insurance_company, insurance_company)
	VALUES('001', 'Allianz');

INSERT INTO carolina_graciolli_siqueira.insurance_companies
	(id_insurance_company, insurance_company)
	VALUES('002', 'Verti');

INSERT INTO carolina_graciolli_siqueira.insurance_companies
	(id_insurance_company, insurance_company)
	VALUES('003', 'AXA');

--- colors ---
INSERT INTO carolina_graciolli_siqueira.colors
	(id_color, color)
	VALUES('001', 'white');

INSERT INTO carolina_graciolli_siqueira.colors
	(id_color, color)
	VALUES('002', 'black');

INSERT INTO carolina_graciolli_siqueira.colors
	(id_color, color)
	VALUES('003', 'gray');

INSERT INTO carolina_graciolli_siqueira.colors
	(id_color, color)
	VALUES('004', 'red');

--- cars ---
INSERT INTO carolina_graciolli_siqueira.cars
	(id_car, id_model, id_color, date_of_purchase, license_plate, km_total)
	VALUES('001', '001', '003', '2018-01-22', 'AAA0101', 12000);

INSERT INTO carolina_graciolli_siqueira.cars
	(id_car, id_model, id_color, date_of_purchase, license_plate, km_total)
	VALUES('002', '001', '004', '2018-04-22', 'AAA0131', 13000);

INSERT INTO carolina_graciolli_siqueira.cars
	(id_car, id_model, id_color, date_of_purchase, license_plate, km_total)
	VALUES('003', '001', '002', '2018-01-22', 'ABA0101', 500);

INSERT INTO carolina_graciolli_siqueira.cars
	(id_car, id_model, id_color, date_of_purchase, license_plate, km_total)
	VALUES('004', '001', '001', '2019-01-22', 'ACA0101', 8000);

INSERT INTO carolina_graciolli_siqueira.cars
	(id_car, id_model, id_color, date_of_purchase, license_plate, km_total)
	VALUES('005', '002', '001', '2018-06-22', 'AAG0401', 11500);

INSERT INTO carolina_graciolli_siqueira.cars
	(id_car, id_model, id_color, date_of_purchase, license_plate, km_total)
	VALUES('006', '002', '002', '2018-11-22', 'BBA0101', 5500);

INSERT INTO carolina_graciolli_siqueira.cars
	(id_car, id_model, id_color, date_of_purchase, license_plate, km_total)
	VALUES('007', '003', '001', '2019-01-22', 'ATU0101', 7800);

INSERT INTO carolina_graciolli_siqueira.cars
	(id_car, id_model, id_color, date_of_purchase, license_plate, km_total)
	VALUES('008', '003', '002', '2020-11-22', 'AAD3101', 12000);

INSERT INTO carolina_graciolli_siqueira.cars
	(id_car, id_model, id_color, date_of_purchase, license_plate, km_total)
	VALUES('009', '003', '002', '2020-01-22', 'BHT0101', 13000);

INSERT INTO carolina_graciolli_siqueira.cars
	(id_car, id_model, id_color, date_of_purchase, license_plate, km_total)
	VALUES('010', '004', '001', '2019-01-22', 'AAA7101', 2000);

INSERT INTO carolina_graciolli_siqueira.cars
	(id_car, id_model, id_color, date_of_purchase, license_plate, km_total)
	VALUES('011', '005', '004', '2019-04-22', 'ACA7101', 12000);

INSERT INTO carolina_graciolli_siqueira.cars
	(id_car, id_model, id_color, date_of_purchase, license_plate, km_total)
	VALUES('012', '005', '001', '2019-03-22', 'FCA7101', 10000);

INSERT INTO carolina_graciolli_siqueira.cars
	(id_car, id_model, id_color, date_of_purchase, license_plate, km_total)
	VALUES('013', '005', '001', '2019-05-22', 'ADT7101', 2000);

INSERT INTO carolina_graciolli_siqueira.cars
	(id_car, id_model, id_color, date_of_purchase, license_plate, km_total)
	VALUES('014', '006', '003', '2019-05-22', 'AWX7101', 12000);

INSERT INTO carolina_graciolli_siqueira.cars
	(id_car, id_model, id_color, date_of_purchase, license_plate, km_total)
	VALUES('015', '006', '001', '2020-05-22', 'QWX7101', 7600);

--- insurances ---
INSERT INTO carolina_graciolli_siqueira.insurances
	(id_insurance, id_car, id_insurance_company, insurance_number)
	VALUES ('201', '001', '001', '90141501');

INSERT INTO carolina_graciolli_siqueira.insurances
	(id_insurance, id_car, id_insurance_company, insurance_number)
	VALUES ('202', '002', '001', '90141502');

INSERT INTO carolina_graciolli_siqueira.insurances
	(id_insurance, id_car, id_insurance_company, insurance_number)
	VALUES ('203', '003', '001', '90141503');

INSERT INTO carolina_graciolli_siqueira.insurances
	(id_insurance, id_car, id_insurance_company, insurance_number)
	VALUES ('204', '004', '001', '90141504');

INSERT INTO carolina_graciolli_siqueira.insurances
	(id_insurance, id_car, id_insurance_company, insurance_number)
	VALUES ('205', '005', '002', '90141505');

INSERT INTO carolina_graciolli_siqueira.insurances
	(id_insurance, id_car, id_insurance_company, insurance_number)
	VALUES ('206', '006', '002', '90141506');

INSERT INTO carolina_graciolli_siqueira.insurances
	(id_insurance, id_car, id_insurance_company, insurance_number)
	VALUES ('207', '007', '002', '90141507');

INSERT INTO carolina_graciolli_siqueira.insurances
	(id_insurance, id_car, id_insurance_company, insurance_number)
	VALUES ('208', '008', '002', '90141508');
	
INSERT INTO carolina_graciolli_siqueira.insurances
	(id_insurance, id_car, id_insurance_company, insurance_number)
	VALUES ('209', '009', '002', '90141509');
	
INSERT INTO carolina_graciolli_siqueira.insurances
	(id_insurance, id_car, id_insurance_company, insurance_number)
	VALUES ('210', '010', '002', '90141510');
	
INSERT INTO carolina_graciolli_siqueira.insurances
	(id_insurance, id_car, id_insurance_company, insurance_number)
	VALUES ('211', '011', '002', '90141511');
	
INSERT INTO carolina_graciolli_siqueira.insurances
	(id_insurance, id_car, id_insurance_company, insurance_number)
	VALUES ('212', '012', '003', '90141512');
	
INSERT INTO carolina_graciolli_siqueira.insurances
	(id_insurance, id_car, id_insurance_company, insurance_number)
	VALUES ('213', '013', '003', '90141513');
	
INSERT INTO carolina_graciolli_siqueira.insurances
	(id_insurance, id_car, id_insurance_company, insurance_number)
	VALUES ('214', '014', '003', '90141514');
	
INSERT INTO carolina_graciolli_siqueira.insurances
	(id_insurance, id_car, id_insurance_company, insurance_number)
	VALUES ('215', '015', '003', '90141515');

--- inspections ---

INSERT INTO carolina_graciolli_siqueira.inspections
	(km, id_car, id_currency, inspection_date, price)
	VALUES (1000, '001', '001', '2021-01-22 13:00:00', 20);

INSERT INTO carolina_graciolli_siqueira.inspections
	(km, id_car, id_currency, inspection_date, price)
	VALUES (3000, '001', '001', '2021-08-22 13:00:00', 23);
	
INSERT INTO carolina_graciolli_siqueira.inspections
	(km, id_car, id_currency, inspection_date, price)
	VALUES (1000, '002', '001', '2021-01-22 13:00:00', 20);

INSERT INTO carolina_graciolli_siqueira.inspections
	(km, id_car, id_currency, inspection_date, price)
	VALUES (4000, '002', '001', '2022-01-22 13:00:00', 27);
	
INSERT INTO carolina_graciolli_siqueira.inspections
	(km, id_car, id_currency, inspection_date, price)
	VALUES (1000, '003', '001', '2021-01-22 13:00:00', 20);
	
INSERT INTO carolina_graciolli_siqueira.inspections
	(km, id_car, id_currency, inspection_date, price)
	VALUES (1000, '004', '001', '2021-01-22 13:00:00', 20);
	
INSERT INTO carolina_graciolli_siqueira.inspections
	(km, id_car, id_currency, inspection_date, price)
	VALUES (1000, '005', '002', '2021-01-22 13:00:00', 25);
	
INSERT INTO carolina_graciolli_siqueira.inspections
	(km, id_car, id_currency, inspection_date, price)
	VALUES (1000, '006', '001', '2021-01-22 13:00:00', 20);
	
INSERT INTO carolina_graciolli_siqueira.inspections
	(km, id_car, id_currency, inspection_date, price)
	VALUES (1000, '007', '001', '2021-01-22 13:00:00', 20);
	
INSERT INTO carolina_graciolli_siqueira.inspections
	(km, id_car, id_currency, inspection_date, price)
	VALUES (1000, '008', '001', '2021-01-22 13:00:00', 20);
	
INSERT INTO carolina_graciolli_siqueira.inspections
	(km, id_car, id_currency, inspection_date, price)
	VALUES (1000, '009', '001', '2021-01-22 13:00:00', 20);
	
INSERT INTO carolina_graciolli_siqueira.inspections
	(km, id_car, id_currency, inspection_date, price)
	VALUES (4000, '009', '001', '2021-08-22 13:00:00', 30);

INSERT INTO carolina_graciolli_siqueira.inspections
	(km, id_car, id_currency, inspection_date, price)
	VALUES (7000, '009', '001', '2022-02-22 13:00:00', 28);

INSERT INTO carolina_graciolli_siqueira.inspections
	(km, id_car, id_currency, inspection_date, price)
	VALUES (1000, '010', '001', '2021-01-22 13:00:00', 20);
	
INSERT INTO carolina_graciolli_siqueira.inspections
	(km, id_car, id_currency, inspection_date, price)
	VALUES (1000, '011', '001', '2021-01-22 13:00:00', 20);
	
INSERT INTO carolina_graciolli_siqueira.inspections
	(km, id_car, id_currency, inspection_date, price)
	VALUES (1000, '012', '003', '2021-01-22 13:00:00', 15);
	
INSERT INTO carolina_graciolli_siqueira.inspections
	(km, id_car, id_currency, inspection_date, price)
	VALUES (1000, '013', '001', '2021-01-22 13:00:00', 20);
	
INSERT INTO carolina_graciolli_siqueira.inspections
	(km, id_car, id_currency, inspection_date, price)
	VALUES (6500, '013', '001', '2021-09-22 13:00:00', 28);

INSERT INTO carolina_graciolli_siqueira.inspections
	(km, id_car, id_currency, inspection_date, price)
	VALUES (1000, '014', '001', '2021-01-22 13:00:00', 20);
	
INSERT INTO carolina_graciolli_siqueira.inspections
	(km, id_car, id_currency, inspection_date, price)
	VALUES (1000, '015', '001', '2021-01-22 13:00:00', 20);