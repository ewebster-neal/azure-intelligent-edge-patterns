DROP TABLE IF EXISTS transactions

CREATE TABLE transactions (
	TransactionID INT NOT NULL IDENTITY(1000000, 1) PRIMARY KEY,
	TransactionTime DATETIME NOT NULL, 
	ItemID INT NOT NULL,
	ItemQty INT NOT NULL,
	CustomerFaceHash NVARCHAR(50) NULL
)