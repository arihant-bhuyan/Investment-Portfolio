-- Insert Asset Information into the Assets Table
INSERT INTO Assets (AssetType, TickerSymbol, AssetName, AssetCategory)
VALUES
('Stock', 'AAPL', 'Apple Inc.', 'Equity'),
('Stock', 'TSLA', 'Tesla Inc.', 'Equity'),
('Stock', 'MSFT', 'Microsoft Corp.', 'Equity'),
('Stock', 'GOOGL', 'Alphabet Inc.', 'Equity'),
('ETF', 'SPY', 'SPDR S&P 500 ETF Trust', 'ETF'),
('ETF', 'QQQ', 'Invesco QQQ Trust', 'ETF'),
('Mutual Fund', 'VFINX', 'Vanguard 500 Index Fund', 'Mutual Fund'),
('Bond ETF', 'AGG', 'iShares Core US Aggregate Bond ETF', 'Bond'),
('ETF', 'GLD', 'SPDR Gold Shares', 'Commodity');
-- Verify
SELECT 
    *
FROM
    Assets;
-- Insert prices into the Assetprices Table
-- Insert AAPL data using import wizard
-- Insert AGG data using import wizard
-- Insert GLD data using import wizard
-- Insert GOOGL data using import wizard
-- Insert MSFT data using import wizard
-- Insert QQQ data using import wizard
-- Insert SPY data using import wizard
-- Insert TSLA data using import wizard
-- Insert VFINX data using import wizard
-- Verify the import
SELECT 
    *
FROM
    assetprices
WHERE
    AssetID = 7
LIMIT 10;

SELECT 
    assetid,
    ClosePrice
FROM
    assetprices
where
	PriceDate = '2024-08-30';
-- After Extracting the Closing prices on 30th Aug 2024, inserted values to MarketPrice table for better calculation later required.
INSERT INTO MarketPrices (AssetID, PriceDate, ClosePrice)
VALUES
(1, '2024-08-30', 229.00),
(2, '2024-08-30', 214.11),
(3, '2024-08-30', 417.14),
(4, '2024-08-30', 163.38),
(5, '2024-08-30', 563.68),
(6, '2024-08-30', 476.27),
(7, '2024-08-30', 522.23),
(8, '2024-08-30', 100.25),
(9, '2024-08-30', 231.29);
-- Verify
SELECT 
    *
FROM
    Marketprices