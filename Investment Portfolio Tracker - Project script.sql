-- Create a Database called Investment Portfolio
Create DATABASE InvestmentPortfolio;
Use InvestmentPortfolio;
-- Create Asset tables
CREATE TABLE Assets (
    AssetID INT PRIMARY KEY AUTO_INCREMENT,
    AssetType VARCHAR(50),
    TickerSymbol VARCHAR(10),
    AssetName VARCHAR(100),
    AssetCategory VARCHAR(50)
);
-- AssetPrices Table: This table stores daily prices of each asset
CREATE TABLE AssetPrices (
    PriceID INT PRIMARY KEY AUTO_INCREMENT,
    AssetID INT,
    PriceDate DATE,
    OpenPrice DECIMAL(10, 2),
    HighPrice DECIMAL(10, 2),
    LowPrice DECIMAL(10, 2),
    ClosePrice DECIMAL(10, 2),
    Volume BIGINT,
    FOREIGN KEY (AssetID) REFERENCES Assets(AssetID)
);
-- PortfolioHoldings Table (Track Current Portfolio): This table will track how much of each asset you own
CREATE TABLE PortfolioHoldings (
    HoldingID INT PRIMARY KEY AUTO_INCREMENT,
    AssetID INT,
    Quantity DECIMAL(10, 2),
    PurchasePrice DECIMAL(10, 2),
    FOREIGN KEY (AssetID) REFERENCES Assets(AssetID)
);
-- AssetAllocation Table: This table tracks how much of the total portfolio is allocated to each asset class
CREATE TABLE AssetAllocation (
    AllocationID INT PRIMARY KEY AUTO_INCREMENT,
    AssetCategory VARCHAR(50),
    AllocationPercentage DECIMAL(5, 2) CHECK (AllocationPercentage <= 100)
);
