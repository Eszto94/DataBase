INSERT INTO Region (Name) VALUES
    ('Észak-Magyarország'),
    ('Dél-Magyarország'),
    ('Kelet-Magyarország'),
    ('Nyugat-Magyarország'),
    ('Közép-Magyarország');

INSERT INTO InvoiceState (Name) VALUES
    ('Elkészült'),
    ('Kiküldve'),
    ('Teljesítve');

INSERT INTO OrderState (Name) VALUES
    ('Elküldve'),
    ('Vissza Igazolva'),
    ('Feldolgozás Alatt'),
    ('Szállítónak Átadva'),
    ('Teljesült');

INSERT INTO Book (Author, Title, PublishedIn, ISBN, Publisher, Translator, Language, Price, Piece, CreatedBy) 
VALUES 
    ('Fekete István', 'Tüskevár', 2024, '9789634867777', 'Móra Könyvkiadó', NULL, 'magyar', 2975, 30, 'Kis János');

INSERT INTO Address (Country, ZipCode, City, PublicPlaceType, PublicPlaceName, HouseNumber, OtherAddress, CreatedBy)
VALUES 
    ('Magyarország', '2200', 'Monor', 'utca', 'Kossuth', '10/B', NULL, 'Nagy Vilmos');

INSERT INTO Customer (Name, Email, PhoneNumber, Password, BillingAddressId, RegionId, CreatedBy) 
VALUES 
    ('Nagy Vilmos', 'nagyvilmos@gmail.com', '+36 30-324-3582', 'Password', 1, 2, 'Nagy Vilmos');

INSERT INTO "Order" (CustomerId, OrderDate, DeliveryAddressId, Amount, OrderStateId, CreatedBy)
VALUES (1, CURRENT_TIMESTAMP, 1, 2975, 1, 'Nagy Vilmos');

INSERT INTO OrderItem (OrderId, BookId, CreatedBy)
VALUES (1, 1, 'Nagy Vilmos');

INSERT INTO Invoice (InvoiceNumber, OrderId, InvoiceStateId, CreatedBy)
VALUES ('B_001_2024', 1, 1, 'Kis János');
