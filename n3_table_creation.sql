
-- Drop Tables 
DROP TABLE IF EXISTS Address, API, Bank_Account, Borrower, Branch_Address, Users, Business_Entity, Business_Entity_Attribute,
Business_User_Role, Component, Country, Currency, Financing_History, Funder, Gov_Entity_Reference, Log_File, Permission, Role, 
Role_Permission, system_config, User_Role, Financing;
 

-- Create Tables
 
CREATE TABLE IF NOT EXISTS Users ( 
User_ID SERIAL NOT NULL ,
Business_Entity_ID INTEGER NOT NULL,
First_Name  VARCHAR(200),
Last_Name   VARCHAR(200),
Company_Email  VARCHAR(200),
Contact_Number VARCHAR(15), 
Active    BOOLEAN,
Deleted   BOOLEAN,
Preffered_Language VARCHAR(35),
Profile_Pic TEXT,
IsLock BOOLEAN,	
CONSTRAINT Users_PK PRIMARY KEY (User_ID, Business_Entity_ID),
CONSTRAINT Users_User_ID_key UNIQUE (User_ID));	
	 	 	  
CREATE TABLE IF NOT EXISTS Business_User_Role (
Business_User_Role_ID SERIAL NOT NULL,
User_ID	INTEGER NOT NULL,
Business_Entity_ID INTEGER NOT NULL,
Business_User_Name	VARCHAR(200),
Component_Names	VARCHAR(200),	
CONSTRAINT Business_User_Role_PK PRIMARY KEY(Business_User_Role_ID, User_ID, Business_Entity_ID),
CONSTRAINT Business_User_Role_Key UNIQUE(Business_User_Role_ID));


CREATE TABLE IF NOT EXISTS User_Role (
User_Role_ID  SERIAL NOT NULL,
Business_Entity_ID INTEGER NOT NULL,
Role_ID INTEGER NOT NULL,	
CONSTRAINT User_Role_PK PRIMARY KEY (User_Role_ID, Business_Entity_ID, Role_ID), 
CONSTRAINT User_Role_Key UNIQUE(User_Role_ID)); 
 

CREATE TABLE IF NOT EXISTS Business_Entity ( 
Business_Entity_ID	SERIAL NOT NULL,
Address_ID INTEGER NOT NULL,
Business_Registration_Number VARCHAR(35),
Business_Name	VARCHAR(200),
Business_Industry VARCHAR(65),
Business_Phone_Number VARCHAR(20),
Country_ID INTEGER,
Branch	 BOOLEAN,
Deleted	 BOOLEAN,	
Bill_Address_ID INTEGER,
Branch_Address_ID INTEGER,	
Bank_Account_ID	INTEGER,	
Business_Logo TEXT,
Borrower BOOLEAN,
CONSTRAINT Business_Entity_PK PRIMARY KEY(Business_Entity_ID, Address_ID, Branch_Address_ID, Bank_Account_ID),
CONSTRAINT Business_Entity_key UNIQUE(Business_Entity_ID));


 
CREATE TABLE IF NOT EXISTS Business_Entity_Attribute(
Business_Entity_Attribute_ID SERIAL NOT NULL,	
Business_Entity_ID	INTEGER NOT NULL,
Attribute_id VARCHAR(200),
Attribute_name VARCHAR(200),
Attribute_value VARCHAR(200),
CONSTRAINT Business_Entity_Attribute_PK PRIMARY KEY(Business_Entity_Attribute_ID, Business_Entity_ID),
CONSTRAINT Business_Entity_Attribute_key UNIQUE(Business_Entity_Attribute_ID));

 
 
CREATE TABLE IF NOT EXISTS Address(
Address_ID SERIAL NOT NULL,
Street_Name	VARCHAR(65),
Additional_Street_Name VARCHAR(65),
City_Name VARCHAR(65),
Postal_Zone VARCHAR(35),
Country_Subentity VARCHAR(65),
CONSTRAINT Address_PK PRIMARY KEY(Address_ID),
CONSTRAINT Address_key UNIQUE(Address_ID));

 
 
CREATE TABLE IF NOT EXISTS Branch_Address(
Branch_Address_ID SERIAL NOT NULL,
Street_Name	VARCHAR(65),
Additional_Street_Name VARCHAR(65),
City_Name VARCHAR(65),
Postal_Zone VARCHAR(35),
Country_Subentity VARCHAR(65), 
CONSTRAINT Branch_Address_PK PRIMARY KEY(Branch_Address_ID),
CONSTRAINT Branch_Address_key UNIQUE(Branch_Address_ID));


									 
CREATE TYPE Financing_method AS ENUM (
  'Pending', 
  'Approved',
  'Reject',
  'Paid',
  '');									 
									 
CREATE TABLE IF NOT EXISTS BORROWER
(
Borrower_Business_Entity_ID	SERIAL NOT NULL,
Financing_Type	VARCHAR(2),
Loan_status	Financing_method,
Loan_Start_Date	VARCHAR(10),
Loan_End_Date VARCHAR(10),
Financing_currency	VARCHAR(4),
Principle_Amt DECIMAL(18,2),
Interest_Rate	 DECIMAL(9,8),
Interest_Amount	 DECIMAL (18,2),
Swift_Charges	 DECIMAL (18,2),
Capitalize_Interest	  DECIMAL(18,2),
Roll_over_effective_date VARCHAR(10),
Roll_over_Maturity_date VARCHAR(10),
Overdue_Amt			 DECIMAL (18,2),	
CONSTRAINT BORROWER_PK PRIMARY KEY(Borrower_Business_Entity_ID),
CONSTRAINT BORROWER_Key UNIQUE(Borrower_Business_Entity_ID));


							   
CREATE TABLE IF NOT EXISTS FINANCING 
(
Financing_ID SERIAL NOT NULL,
Financing_Name VARCHAR(35),	
Financing_Type	VARCHAR(2),
Financing_Status Financing_method,	
Invoice_ID 	INTEGER NOT NULL,
Funder_Business_Entity_ID INTEGER NOT NULL,
Batch   BOOLEAN,
FX_Contract_Number VARCHAR(60),		
Currency_Id INTEGER,
Disbursement_Date VARCHAR(10),
Disbursement_Amount DECIMAL(18,2),	
Maturity_Date VARCHAR(10),
Tenor NUMERIC(3),	
Early_Payment_Date VARCHAR(10),
Early_Payment_Discount_Rate DECIMAL(9,8),
Early_Payment_Discount_Amt DECIMAL(18,2),	
Interest_Rate DECIMAL(9,8),
Interest_Amount DECIMAL(18,2),	
Dynamic_Discount_Rate DECIMAL(9,8),
Dynamic_Discount_Amt DECIMAL(18,2),	
Discount_Expiration_Date VARCHAR(10),
Other_Charges DECIMAL(18,2),
Total_Charges DECIMAL(18,2),	
CONSTRAINT FINANCING_KEY PRIMARY KEY(Financing_ID, Funder_Business_Entity_ID, Invoice_ID),
CONSTRAINT FINANCING_PK UNIQUE(Financing_ID));		
						   
							   

									 
							    
CREATE TABLE IF NOT EXISTS FINANCING_HISTORY
(
Financing_History_ID SERIAL NOT NULL,
Financing_Type	VARCHAR(2),
Funder_Business_Entity_ID INTEGER NOT NULL,
Financing_ID 	INTEGER NOT NULL,
Loan_status	Financing_method,
Invoice_ID INTEGER NOT NULL,	
Loan_Start_Date	 VARCHAR(10),
Loan_End_Date	VARCHAR(10),
Roll_over_effective_date VARCHAR(10),
Roll_over_Maturity_date	VARCHAR(10),
Original_Loan_Amt	DECIMAL(18,2),
Interest_Accrued_Amt DECIMAL(18,2),
Over_Due_Amt DECIMAL(18,2),
Date_Time TIMESTAMP,	
CONSTRAINT FINANCING_HISTORY_KEY PRIMARY KEY(Financing_History_ID, Funder_Business_Entity_ID, Financing_ID, Invoice_ID),
CONSTRAINT FINANCING_HISTORY_PK UNIQUE(Financing_History_ID));		
 

 
CREATE TABLE IF NOT EXISTS System_Config
(
System_config_ID  SERIAL PRIMARY KEY,
System_key				VARCHAR(100),
System_value				VARCHAR(200),
category				VARCHAR(20),
System_comment				VARCHAR(200),
System_Date_Time				TIMESTAMP	 	
);



CREATE TABLE IF NOT EXISTS Funder
(
Business_Entity_ID SERIAL NOT NULL,
CONSTRAINT Funder_Key PRIMARY KEY(Business_Entity_ID),
CONSTRAINT Funder_PK UNIQUE(Business_Entity_ID)	
);
 
 
 
CREATE TABLE IF NOT EXISTS Bank_Account(   
Bank_Account_ID	 SERIAL NOT NULL,
Business_Entity_ID	INTEGER,
Bank_Account_Number VARCHAR(35),
Bank_Name VARCHAR(200),
Bank_BIC VARCHAR(35),
Currency_ID INTEGER,
Country_ID INTEGER,
Address_ID INTEGER,	
CONSTRAINT Bank_Account_Key	PRIMARY KEY(Bank_Account_ID,Business_Entity_ID, Currency_ID, Country_ID, Address_ID),
CONSTRAINT Bank_Account_PK UNIQUE(Business_Entity_ID)		
);


 
CREATE TABLE IF NOT EXISTS  Log_File(  
Log_ID	SERIAL NOT NULL,
User_ID	VARCHAR(35),
category VARCHAR(20),
Log_Input TEXT,	
Log_output TEXT, 
Log_Result BOOLEAN,	
Log_Action VARCHAR(35),
Log_Field VARCHAR(100),
Log_Date_Time TIMESTAMP,	
CONSTRAINT Log_File_Key PRIMARY KEY(Log_ID),
CONSTRAINT Log_File_PK UNIQUE(Log_ID) );
 
		
 
CREATE TABLE IF NOT EXISTS  GOV_ENTITY_REFERENCE
( 
GOV_ENTITY_REFERENCE_ID SERIAL NOT NULL,	
Business_Registration_Number VARCHAR(35),
Issuance_agency_id	VARCHAR(100),
UEN_status	 VARCHAR(35),
Entity_Name	VARCHAR(100),
Entity_Type	VARCHAR(35),
UEN_Issue_Date	VARCHAR(10),
Reg_Street_Name	VARCHAR(100),
Reg_Postal_Code	VARCHAR(100),
Country VARCHAR(20),	
CONSTRAINT GOV_ENTITY_REFERENCE_Key	PRIMARY KEY(GOV_ENTITY_REFERENCE_ID),
CONSTRAINT GOV_ENTITY_REFERENCE_PK UNIQUE(GOV_ENTITY_REFERENCE_ID)	
);

 
CREATE TABLE IF NOT EXISTS  Country(   
Country_ID SERIAL NOT NULL,
Country_Name	VARCHAR(255),
Country_Code VARCHAR(3) NOT NULL,
Dial_Code VARCHAR(5),
Dial_Sub_Code VARCHAR(30),
CONSTRAINT Country_Key PRIMARY KEY(Country_ID,Country_Code),
CONSTRAINT Country_PK UNIQUE(Country_ID)	
);


CREATE TYPE category_method AS ENUM (
  'API', 
  'Menu');
  
CREATE TABLE IF NOT EXISTS Component (	
   Component_ID VARCHAR(35) NOT NULL,
   Reference_ID VARCHAR(35) NOT NULL,
   Category category_method,
   Permission_ID VARCHAR(35) NOT NULL,
CONSTRAINT Component_Key PRIMARY KEY (Component_ID, Reference_ID, Permission_ID),
CONSTRAINT Component_PK UNIQUE(Component_ID)
); 
  
CREATE TYPE permission_method AS ENUM (
  'Create', 
  'Update',
  'Read',
  'Delete');
  
  
CREATE TABLE IF NOT EXISTS Permission (
   Permission_ID VARCHAR(35) NOT NULL,
   Permission_name permission_method,
   Permission_Description VARCHAR(200),
CONSTRAINT Permission_Key PRIMARY KEY(Permission_ID),
CONSTRAINT Permission_PK Unique(Permission_ID)	
); 
   
  
  
CREATE TABLE IF NOT EXISTS Role (
Role_ID	 VARCHAR(35) NOT NULL,
Role_Name	VARCHAR(200),
CONSTRAINT Role_Key PRIMARY KEY(Role_ID),
CONSTRAINT Role_PK Unique(Role_ID)	
);  
  
  
CREATE TABLE IF NOT EXISTS Role_Permission ( 
Role_Permission_Id	VARCHAR(35) NOT NULL,
Role_ID				VARCHAR(35) NOT NULL,
Permission_ID		VARCHAR(35) NOT NULL,
CONSTRAINT Role_Permission_Key PRIMARY KEY(Role_Permission_Id, Role_ID, Permission_ID),
CONSTRAINT Role_Permission_PK Unique(Role_Permission_Id));


CREATE TABLE IF NOT EXISTS API (
API_ID VARCHAR(35) NOT NULL,
API_Name VARCHAR(100),
URL	 VARCHAR(200),
Description	VARCHAR(200),
CONSTRAINT API_Key PRIMARY KEY(API_ID),	
CONSTRAINT API_PK Unique(API_ID)	
);

									 
CREATE TYPE Invoice_method AS ENUM (
  'Pending', 
  'Approved',
  'Reject',
  'Paid');									 
									 
CREATE TABLE IF NOT EXISTS Invoice(
Invoice_ID SERIAL NOT NULL,
Invoice_Number	VARCHAR(35),
Currency_Id	 INTEGER NOT NULL,
Invoice_Issue_Date	VARCHAR(10),
Invoice_Start_Date	VARCHAR(10),
Invoice_Due_Date	VARCHAR(10),
Purchase_Order_Reference_Number	VARCHAR(35),
Invoice_Status	Invoice_method,
Invoice_Total_Tax_Amount DECIMAL(18,2),
Invoice_Total_Amount	DECIMAL(18,2),
GST		DECIMAL(9,8),
Value_Added_Tax		DECIMAL(9,8),
Withholding_Tax		DECIMAL(9,8),
Payment_Reference_Number VARCHAR(35),
Address_Id INTEGER NOT NULL,
Buyer_Business_Entity_Id	INTEGER NOT NULL,
Supplier_Business_Entity_Id  INTEGER NOT NULL,
CONSTRAINT Invoice_Key PRIMARY KEY(Invoice_ID, Currency_Id, Address_Id, Buyer_Business_Entity_Id, Supplier_Business_Entity_Id),	
CONSTRAINT Invoice_PK Unique(Invoice_ID)	
);									 
									 
CREATE TABLE IF NOT EXISTS Invoice_Line_Item(									 
Line_Item_ID	SERIAL NOT NULL,
Invoice_ID		INTEGER NOT NULL,
Product_Code	VARCHAR(50),
Description		VARCHAR(255),
Quantity		NUMERIC(5),
Unit_Price		DECIMAL(18,2),
Line_Item_Amount DECIMAL(18,2),
CONSTRAINT Invoice_Line_Item_Key PRIMARY KEY(Line_Item_ID, Invoice_Id),	
CONSTRAINT Invoice_Line_Item_PK Unique(Line_Item_ID)		
);


CREATE TABLE IF NOT EXISTS Goods_Origination(
Goods_ID	SERIAL NOT NULL,
Invoice_ID	INTEGER NOT NULL,
Port_Of_Loading	 VARCHAR(200),
Port_Of_Discharge VARCHAR(200),
Shipment_Type	 VARCHAR(200),
Goods_Information	VARCHAR(200),
Other_Parties_Information	VARCHAR(200),
CONSTRAINT Goods_Origination_Key PRIMARY KEY(Goods_ID, Invoice_Id),	
CONSTRAINT Goods_Origination_PK Unique(Goods_ID)		
);
									 
									 
									 
									 
									 
-- Add foreign key to the tables

-- 

 

ALTER TABLE Users
ADD CONSTRAINT Users_Business_Entity_ID_fkey FOREIGN KEY (Business_Entity_ID) REFERENCES business_entity (business_entity_id) MATCH SIMPLE ON UPDATE CASCADE ON DELETE CASCADE;

 
 

