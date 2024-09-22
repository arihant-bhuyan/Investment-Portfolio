-- Retreiving Historical Prices from the Asset Prices table 
-- Automate the Transaction Insertion Using a Stored Procedure
-- The stored procedure will:
	-- Take the AssetID, TransactionDate, Quantity, and TransactionType as inputs.
	-- Retrieve the closing price from the AssetPrices table for that date.
	-- Insert the transaction into the Transactions table using the retrieved closing price.
    
DELIMITER //

CREATE PROCEDURE AddTransaction(
    IN asset_id INT,               -- AssetID (e.g., 1 for AAPL)
    IN transaction_date DATE,      -- Date of the transaction (e.g., '2023-09-01')
    IN quantity DECIMAL(10,2),     -- Number of shares/units bought or sold
    IN transaction_type ENUM('BUY', 'SELL')  -- Transaction type: 'BUY' or 'SELL'
)
BEGIN
    DECLARE closing_price DECIMAL(10,2);  -- Variable to store the closing price

    -- Retrieve the closing price from AssetPrices table
    SELECT ClosePrice INTO closing_price
    FROM AssetPrices 
    WHERE AssetID = asset_id
    AND PriceDate = transaction_date;

    -- Insert the transaction with the retrieved closing price
    INSERT INTO Transactions (AssetID, TransactionDate, Quantity, TransactionType, Price)
    VALUES (asset_id, transaction_date, quantity, transaction_type, closing_price);
END //

DELIMITER ;

-- Call the Stored Procedure to Insert Transactions

-- Buy transactions
CALL AddTransaction(1, '2023-09-01', 10, 'BUY');     -- AAPL
CALL AddTransaction(2, '2023-09-05', 20, 'BUY');     -- TSLA
CALL AddTransaction(9, '2023-11-10', 50, 'BUY');     -- GLD
CALL AddTransaction(9, '2023-11-10', 50, 'BUY');     -- GLD (additional)
CALL AddTransaction(4, '2023-11-27', 35, 'BUY');     -- GOOGL
CALL AddTransaction(3, '2023-12-11', 15, 'BUY');     -- MSFT
CALL AddTransaction(6, '2023-12-15', 10, 'BUY');     -- QQQ
CALL AddTransaction(5, '2023-12-20', 100, 'BUY');    -- SPY
CALL AddTransaction(7, '2024-01-16', 20, 'BUY');     -- VFINX
CALL AddTransaction(8, '2024-05-06', 15, 'BUY');     -- AGG
CALL AddTransaction(6, '2024-05-10', 25, 'BUY');     -- QQQ (additional)

-- Sell transactions
CALL AddTransaction(1, '2023-09-15', 5, 'SELL');     -- AAPL
CALL AddTransaction(2, '2023-09-25', 5, 'SELL');     -- TSLA
CALL AddTransaction(7, '2024-02-12', 12, 'SELL');    -- VFINX
CALL AddTransaction(3, '2024-03-04', 7, 'SELL');     -- MSFT
CALL AddTransaction(4, '2024-03-18', 25, 'SELL');    -- GOOGL
CALL AddTransaction(5, '2024-04-22', 35, 'SELL');    -- SPY
CALL AddTransaction(6, '2024-06-03', 10, 'SELL');    -- QQQ
CALL AddTransaction(8, '2024-06-21', 7, 'SELL');     -- AGG
CALL AddTransaction(9, '2024-06-26', 3, 'SELL');     -- GLD

USE investmentportfolio;
-- Verify the transactions
SELECT 
    *
FROM
    Transactions
ORDER BY TransactionDate;

Truncate Transactions;
