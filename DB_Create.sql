CREATE TABLE Region (
    Id SERIAL PRIMARY KEY,
    Name VARCHAR(20) NOT NULL
);

CREATE TABLE InvoiceState (
    Id SERIAL PRIMARY KEY,
    Name VARCHAR(20) NOT NULL
);

CREATE TABLE OrderState (
    Id SERIAL PRIMARY KEY,
    Name VARCHAR(20) NOT NULL
);

CREATE TABLE Address (
    Id BIGSERIAL PRIMARY KEY,
    Country VARCHAR(50) NOT NULL,
    ZipCode VARCHAR(15) NOT NULL,
    City VARCHAR(50) NOT NULL,
    PublicPlaceType VARCHAR(20) NOT NULL,
    PublicPlaceName VARCHAR(50) NOT NULL,
    HouseNumber VARCHAR(10),
    OtherAddress VARCHAR(50),
    CreatedOn TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    CreatedBy VARCHAR(50) NOT NULL,
    LastModifiedOn TIMESTAMP,
    LastModifiedBy VARCHAR(50)
);

CREATE TABLE Book (
    Id BIGSERIAL PRIMARY KEY,
    Author VARCHAR(50) NOT NULL,
    Title VARCHAR(250) NOT NULL,
    PublishedIn INT NOT NULL,
    ISBN VARCHAR(50) NOT NULL,
    Publisher VARCHAR(100) NOT NULL,
    Translator VARCHAR(50),
    Language VARCHAR(50) NOT NULL,
    Price INT NOT NULL,
    Piece INT NOT NULL,
    CreatedOn TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    CreatedBy VARCHAR(50) NOT NULL,
    LastModifiedOn TIMESTAMP,
    LastModifiedBy VARCHAR(50)
);

CREATE TABLE Customer (
    Id BIGSERIAL PRIMARY KEY,
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
    FOREIGN KEY (BillingAddressId) REFERENCES Address (Id),
    FOREIGN KEY (RegionId) REFERENCES Region (Id)
);

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
    FOREIGN KEY (CustomerId) REFERENCES Customer (Id),
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

-- Create indexes
CREATE INDEX IX_Book_Author ON Book (Author);
CREATE INDEX IX_Book_Title ON Book (Title);