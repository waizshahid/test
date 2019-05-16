
Drop Table Shipment
Drop Table Dispatch
Drop Table OrderDetail
Drop Table Printing
Drop Table Tapestock
Drop Table Tapeline
Drop Table Customer
Drop Table Product
Drop Table LoomStock
Drop Table Loom
Drop Table Bag_Type
Drop Table Mixture
Drop Table Inventory
Drop Table Item
Drop Table Supplier




CREATE TABLE Supplier (
	Sup_ID int NOT NULL,
	Sup_Address varchar(20),
	Phone int,
	Sup_Company varchar(20) NOT NULL,
    PRIMARY KEY(Sup_ID)
)

CREAtE TABLE Item(
	Item_ID int NOt NULL,
	Item_Name varchar(20),
	
	PRIMARY KEY(Item_ID)
)

CREATE TABLE Inventory (
	Inv_ID int NOT NULL,
	EnteryTime DATETIME NOT NULL,
	Sup_Company varchar(20),
	Item_Name varchar(20),
	Quantity int,
	T_Price int,
	Comments varchar(50),
    PRIMARY KEY(Inv_ID)
)



CREATE TABLE Mixture (
	Mix_ID int NOT NULL,
	Mix_Name varchar(20),
	Item_ID int,
    PRIMARY KEY(Mix_ID),
	FOREIGN KEY (Item_ID) REFERENCES Item(Item_ID)
	
)


CREATE TABLE Bag_Type (
    Bag_ID int NOT NULL,
    Bag_Width int,
    Bag_Length int,
	Bag_Frame varchar(20),
	Color varchar(20),

    PRIMARY KEY (Bag_ID)
	
)


CREATE TABLE Loom (
    L_Number int NOT NULL,
	Mix_ID int NOT NULL,
	Bag_ID int NOT NULL,
	Quantity int,

    PRIMARY KEY (L_Number),

	FOREIGN KEY (Bag_ID) REFERENCES Bag_Type(Bag_ID)
)


CREATE TABLE LoomStock (
	Bag_ID int,
	Mix_ID int,
	Quantity int,

    PRIMARY KEY(Bag_ID,Mix_ID),

	FOREIGN KEY (Bag_ID) REFERENCES Bag_Type(Bag_ID),
	FOREIGN KEY (Mix_ID) REFERENCES Mixture(Mix_ID)

)


CREATE TABLE Product (
	Pro_ID int NOT NULL,
	Bag_ID int NOT NULL,
	Cus_ID varchar(20) NOT NULL,
	Mix_ID int NOT NULL,
	Sterio varchar(20) NOT NULL,
    PRIMARY KEY(Pro_ID),
	FOREIGN KEY(Bag_ID,Mix_ID) REFERENCES LoomStock(Bag_ID,Mix_ID)
)


CREATE TABLE Customer (
    Cus_ID varchar(20) NOT NULL,
	Cus_Address varchar(20),
	Phone int,
	Email varchar(50),
	NTN int,
	GST int,

    PRIMARY KEY (Cus_ID)
)


CREATE TABLE Tapeline (
	Batch_ID int NOT NULL,
	Mix_ID int,
	Denier int,
	Color varchar(20),
    PRIMARY KEY(Batch_ID),
	FOREIGN KEY (Mix_ID) REFERENCES Mixture(Mix_ID)
)

CREATE TABLE TapeStock (
	Mix_ID int NOT NULL,
	Quantity int,

    PRIMARY KEY (Mix_ID),
	FOREIGN KEY (Mix_ID) REFERENCES Mixture(Mix_ID)
)

CREATE TABLE Printing (
	Pri_ID int NOT NULL,
	Pro_ID int,
	Quantity int,

    PRIMARY KEY(Pri_ID)
)

CREATE TABLE OrderDetail (
	Ord_ID int NOT NULL,
	Pro_ID int NOT NULL,
	Cus_ID varchar(20) NOT NULL,
	Quantity int NOT NULL,
    PRIMARY KEY(Ord_ID,Pro_ID),
	FOREIGN KEY (Cus_ID) REFERENCES Customer(Cus_ID)
)

CREATE TABLE Dispatch (
	Dis_ID int NOT NULL,
	Ord_ID int NOT NULL,
	Pro_ID int NOT NULL,
	Cus_ID varchar(20) NOT NULL,
	Quantity int NOT NULL,
    PRIMARY KEY(Dis_ID),
	FOREIGN KEY (Pro_ID) REFERENCES Product(Pro_ID)
)



CREATE TABLE Shipment (
	Ship_ID int NOT NULL,
	Sup_ID int,
	Item_ID int NOT NULL,
	Quantity int NOT NULL,
	Price int NOT NULL,
    PRIMARY KEY(Ship_ID),
	FOREIGN KEY (Sup_ID) REFERENCES Supplier(Sup_ID),
	FOREIGN KEY (Item_ID) REFERENCES Item(Item_ID)
)

