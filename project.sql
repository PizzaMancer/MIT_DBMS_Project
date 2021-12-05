CREATE TABLE CUSTOMER (
    cust_id INT,
    email_id VARCHAR(50) NOT NULL,
    cust_name VARCHAR(25) NOT NULL,
    address VARCHAR(100),
    state VARCHAR(25),
    city VARCHAR(50),
    pincode VARCHAR(10) NOT NULL,
    password VARCHAR(25) NOT NULL,
    cust_status VARCHAR(10) NOT NULL,
    PRIMARY KEY (cust_id)
);

CREATE TABLE ACCOUNT (
    account_id INT,
    eleboard_id INT,
    cust_id INT,
    cust_name VARCHAR(25),
    account_type VARCHAR(15),
    address VARCHAR(100),
    rr_number VARCHAR(10) NOT NULL,
    acc_status VARCHAR(10) NOT NULL,
    PRIMARY KEY (account_id),
    FOREIGN KEY (cust_id) 
    	REFERENCES CUSTOMER(cust_id) 
    	ON DELETE CASCADE,
    FOREIGN KEY (eleboard_id) 
    	REFERENCES ELECTRICITY_BOARD 
    	ON DELETE CASCADE
);


CREATE TABLE FEEDBACK (
	feedback_id INT,
	cust_id INT,
	feedback VARCHAR(200),
	feedback_date DATE,
	feed_status VARCHAR(10),
	PRIMARY KEY (feedback_id),
	FOREIGN KEY (cust_id) 
		REFERENCES CUSTOMER 
		ON DELETE CASCADE
);


CREATE TABLE BILLING(
	bill_number INT PRIMARY KEY,
	acc_id INT, 
	cust_id INT, 
	bill_amt NUMBER(10, 2), 
	paid_amt NUMBER(10, 2), 
	excess_paid NUMBER(10, 2), 
	payment_mode VARCHAR(25), 
	payment_date DATE, 
	payment_time TIMESTAMP,
	rr_number VARCHAR(10), 
	bill_status VARCHAR(10),
	PRIMARY KEY (bill_number),
	FOREIGN KEY (cust_id) 
		REFERENCES CUSTOMER 
		ON DELETE CASCADE,
	FOREIGN KEY (acc_id)
		REFERENCES ACCOUNT
		ON DELETE CASCADE
); 

CREATE TABLE TARIFF(
	tariff_id INT PRIMARY KEY,
	tariff_description VARCHAR(100),
	tariff_status VARCHAR(10),
	PRIMARY KEY (tariff_id),
);

CREATE TABLE ELECTRICITY_BOARD(
	tariff_id INT,
	ele_board VARCHAR(25),
	logo VARCHAR(100),
	note VARCHAR(100),
	eb_status VARCHAR(10),
	PRIMARY KEY (tariff_id)
	FOREIGN KEY (tariff_id)
		REFERENCES TARIFF
		ON DELETE CASCADE
);

CREATE TABLE REGION(
	zone_no INT,
	population NUMBER(10, 0),
	min_requirement INT,
	output INT,
	emission VARCHAR(25),
	PRIMARY KEY (zone_no)
);
