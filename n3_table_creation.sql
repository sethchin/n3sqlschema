-- Create nemo3 tables 

CREATE TABLE Users ( 
User_ID     VARCHAR(35) NOT NULL,
Business_Entity_ID VARCHAR(35),
First_Name  VARCHAR(200),
Last_Name   VARCHAR(200),
Company_Email  VARCHAR(200),
Contact_Number VARCHAR(15), 
Active    BOOLEAN,
Deleted   BOOLEAN,
Preffered_Language VARCHAR(35),
Profile_Pic TEXT, 
PRIMARY KEY (User_ID)
	);
	 
 
CREATE TABLE User_Role (
User_Role_ID  VARCHAR(35) NOT NULL,
User_Role   VARCHAR(35),
Business_Entity_ID VARCHAR(35) NOT NULL,
PRIMARY KEY (User_Role_ID, Business_Entity_ID)
);



CREATE TABLE Business_User_Role (
Business_User_Role_ID VARCHAR(35) NOT NULL,
User_ID	VARCHAR(35) NOT NULL,
Business_Entity_ID VARCHAR(35) NOT NULL,
Business_User_Name	VARCHAR(200),
Component_Names	VARCHAR(200),	
PRIMARY KEY(Business_User_Role_ID, User_ID, Business_Entity_ID)
);



CREATE TABLE Business_Entity ( 
Business_Entity_ID	VARCHAR(35) NOT NULL,
Address_ID VARCHAR(35) NOT NULL,
Business_Registration_Number VARCHAR(35),
Business_Name	VARCHAR(200),
Business_Industry VARCHAR(65),
Business_Phone_Number VARCHAR(20),
Country_ID VARCHAR(35),
Branch	 BOOLEAN,
Deleted	 BOOLEAN,	
Bill_Address_ID VARCHAR(35),
Branch_Address_ID VARCHAR(35),	
Bank_Account_ID	VARCHAR(35),	
Business_Logo TEXT,
Borrower BOOLEAN,
PRIMARY KEY(Business_Entity_ID, Address_ID)
 );


CREATE TABLE Business_Entity_Attribute(
Business_Entity_Attribute_ID VARCHAR(35),	
Business_entity_id VARCHAR(200),
Attribute_id VARCHAR(200),
Attribute_name VARCHAR(200),
Attribute_value VARCHAR(200),
PRIMARY KEY(Business_Entity_Attribute_ID)	
);

 

CREATE TABLE Address(
Address_ID VARCHAR(35) NOT NULL,
Street_Name	VARCHAR(65),
Additional_Street_Name VARCHAR(65),
City_Name VARCHAR(65),
Postal_Zone VARCHAR(35),
Country_Subentity VARCHAR(65),
PRIMARY KEY(Address_ID)
);

 

CREATE TABLE Branch_Address(
Branch_Address_ID VARCHAR(35) NOT NULL,
Street_Name	VARCHAR(65),
Additional_Street_Name VARCHAR(65),
City_Name VARCHAR(65),
Postal_Zone VARCHAR(35),
Country_Subentity VARCHAR(65), 
PRIMARY KEY(Branch_Address_ID)
);

 

CREATE TABLE BORROWER
(
Business_Entity_ID	VARCHAR(35) NOT NULL,
Financing_ID VARCHAR(35),
Financing_Type	VARCHAR(2),
Loan_status	VARCHAR(10),
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
	PRIMARY KEY(Business_Entity_ID)
);



CREATE TABLE FINANCING_HISTORY
(
Financing_History_ID VARCHAR(35) NOT NULL,
Financing_Type	VARCHAR(2),
Business_Entity_ID		VARCHAR(35),
Loan_status		VARCHAR(10),
Invoice_ID VARCHAR(35),	
Loan_Start_Date	 VARCHAR(10),
Loan_End_Date	VARCHAR(10),
Roll_over_effective_date VARCHAR(10),
Roll_over_Maturity_date	VARCHAR(10),
Original_Loan_Amt	DECIMAL(18,2),
Interest_Accrued_Amt DECIMAL(18,2),
Over_Due_Amt DECIMAL(18,2),
Date_Time TIMESTAMP,	
PRIMARY KEY(Financing_History_ID)
);



CREATE TABLE System_Config
(
System_config_ID  SERIAL PRIMARY KEY,
System_key				VARCHAR(100),
System_value				VARCHAR(200),
category				VARCHAR(20),
System_comment				VARCHAR(200),
System_Date_Time				TIMESTAMP	
 	
);


CREATE TABLE Funder
(
Business_Entity_ID	 VARCHAR(35) NOT NULL,
Created_By				VARCHAR(35),
Created_Date_Time				TIMESTAMP,	
Updated_By				VARCHAR(35),
Updated_Date_Time				TIMESTAMP,
	PRIMARY KEY(Business_Entity_ID)
);
 

 
CREATE TABLE Bank_Account(   
Bank_Account_ID	 VARCHAR(35) NOT NULL,
Business_Entity_ID	VARCHAR(35),
Bank_Account_Number VARCHAR(35),
Bank_Name VARCHAR(200),
Bank_BIC VARCHAR(35),
Currency_ID VARCHAR(35),
Country_ID VARCHAR(35),
Address_ID VARCHAR(35),	
	PRIMARY KEY(Bank_Account_ID)
)


CREATE TABLE Log_File(  
Log_ID	VARCHAR(35) NOT NULL,
User_ID	VARCHAR(35),
category VARCHAR(20),
EXTENDED(Log_Input TEXT,	
Log_output TEXT, 
Log_Result BOOLEAN,	
Log_Action VARCHAR(35),
Log_Field VARCHAR(100),
Log_Date_Time TIMESTAMP,	
PRIMARY KEY(Log_ID)
)
 
		
CREATE TABLE GOV_ENTITY_REFERENCE
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
	PRIMARY KEY(GOV_ENTITY_REFERENCE_ID)
)

	
CREATE TABLE Country(   
Country_ID SERIAL NOT NULL,
Country_Name	VARCHAR(255),
Country_Code VARCHAR(3),
Dial_Code VARCHAR(5),
Dial_Sub_Code VARCHAR(30),
	PRIMARY KEY(Country_ID,Country_Code)
)
 

CREATE TABLE Currency(   
Currency_ID SERIAL NOT NULL,
Currency_Name	VARCHAR(255) NOT NULL,
Currency_Code_Alpha VARCHAR(3) NOT NULL,
Currency_Code_Numeric NUMERIC(3)NOT NULL,
	PRIMARY KEY(Currency_ID,Currency_Code_Alpha)
)



  
	
	







	
	