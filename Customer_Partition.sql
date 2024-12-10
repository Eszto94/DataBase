drop table invoice; 
drop table orderitem;
drop table "Order";
drop table Customer;

CREATE TABLE Customer (
    Id BIGSERIAL,
    Name VARCHAR(100) NOT NULL,
    Email VARCHAR(50) NOT NULL,
    PhoneNumber VARCHAR(20) NOT NULL,
    Password VARCHAR(25) NOT NULL,
    BillingAddressId BIGINT NOT NULL,
    RegionId INT NOT NULL,
    CreatedOn TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    CreatedBy VARCHAR(50) NOT NULL,
    LastModifiedOn TIMESTAMP,
    LastModifiedBy VARCHAR(50),
    PRIMARY key (Id, RegionId),
    FOREIGN KEY (BillingAddressId) REFERENCES Address (Id),
    FOREIGN KEY (RegionId) REFERENCES Region (Id)
) PARTITION BY LIST (RegionId);

CREATE TABLE Customer_Eszak PARTITION OF Customer
FOR VALUES IN (1);

CREATE TABLE Customer_Del PARTITION OF Customer
FOR VALUES IN (2);

CREATE TABLE Customer_Kelet PARTITION OF Customer
FOR VALUES IN (3);

CREATE TABLE Customer_Nyugat PARTITION OF Customer
FOR VALUES IN (4);

CREATE TABLE Customer_Kozep PARTITION OF Customer
FOR VALUES IN (5);

CREATE TABLE "Order" (
    Id BIGSERIAL PRIMARY KEY,
    CustomerId BIGINT NOT NULL,
    OrderDate TIMESTAMP NOT NULL,
    DeliveryAddressId BIGINT NOT NULL,
    Amount INT NOT NULL,
    OrderStateId INT NOT NULL,
    CreatedOn TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    CreatedBy VARCHAR(50) NOT NULL,
    LastModifiedOn TIMESTAMP,
    LastModifiedBy VARCHAR(50),
    FOREIGN KEY (OrderStateId) REFERENCES OrderState (Id),
    FOREIGN KEY (DeliveryAddressId) REFERENCES Address (Id)
);

CREATE TABLE OrderItem (
    Id BIGSERIAL PRIMARY KEY,
    OrderId BIGINT NOT NULL,
    BookId BIGINT NOT NULL,
    CreatedOn TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    CreatedBy VARCHAR(50) NOT NULL,
    LastModifiedOn TIMESTAMP,
    LastModifiedBy VARCHAR(50),
    FOREIGN KEY (OrderId) REFERENCES "Order" (Id),
    FOREIGN KEY (BookId) REFERENCES Book (Id)
);

CREATE TABLE Invoice (
    Id BIGSERIAL PRIMARY KEY,
    InvoiceNumber VARCHAR(20) NOT NULL,
    OrderId BIGINT NOT NULL,
    InvoiceStateId INT NOT NULL,
    CreatedOn TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    CreatedBy VARCHAR(50) NOT NULL,
    LastModifiedOn TIMESTAMP,
    LastModifiedBy VARCHAR(50),
    FOREIGN KEY (InvoiceStateId) REFERENCES InvoiceState (Id),
    FOREIGN KEY (OrderId) REFERENCES "Order" (Id)
);
