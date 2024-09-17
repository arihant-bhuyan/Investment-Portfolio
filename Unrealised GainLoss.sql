-- Calculate unrealized gains/losses for open stock positions by comparing the average purchase price of remaining shares with their current market price on 2024-08-30.
-- Calculate remaining shares (open positions) for each asset.
SELECT 
    a.AssetID,
    a.TickerSymbol,
    SUM(CASE
        WHEN t.TransactionType = 'BUY' THEN t.Quantity
        ELSE - t.Quantity
    END) AS RemainingQuantity
FROM
    Transactions t
        JOIN
    assets a ON t.AssetID = a.AssetID
GROUP BY AssetID
HAVING RemainingQuantity > 0;

-- Calculate Average Purchase Price for Remaining Shares
SELECT 
    AssetID,
    AVG(Price) AS AvgPurchasePrice
FROM Transactions
WHERE TransactionType = 'BUY'
GROUP BY AssetID; -- This query calculates the average price for each asset's buy transactions, which will be used to calculate the unrealized gains/losses.

-- Join with Market Prices and Calculate Unrealised Gains/Losses
-- Assuming Closing price of 30th Aug,2024 = CurrentPrice
SELECT 
    a.AssetID,
    a.TickerSymbol,
    SUM(CASE
        WHEN t.TransactionType = 'BUY' THEN t.Quantity
        ELSE - t.Quantity
    END) AS RemainingQuantity,
    AVG(CASE
        WHEN t.TransactionType = 'BUY' THEN t.Price
        ELSE NULL
    END) AS AvgPurchasePrice,
    mp.ClosePrice AS CurrentPrice,
    (mp.ClosePrice - AVG(CASE
        WHEN t.TransactionType = 'BUY' THEN t.Price
        ELSE NULL
    END)) * SUM(CASE
        WHEN t.TransactionType = 'BUY' THEN t.Quantity
        ELSE - t.Quantity
    END) AS UnrealizedGainLoss
FROM
    Transactions t
        JOIN
    Assets a ON t.AssetID = a.AssetID
        JOIN
    MarketPrices mp ON t.AssetID = mp.AssetID
WHERE
    mp.PriceDate = '2024-08-30'
GROUP BY a.AssetID , a.TickerSymbol , mp.ClosePrice
HAVING RemainingQuantity > 0;

SELECT 
    t.AssetID,
    a.TickerSymbol,
    SUM(CASE WHEN t.TransactionType = 'BUY' THEN t.Quantity ELSE -t.Quantity END) AS RemainingQuantity,
    AVG(CASE WHEN t.TransactionType = 'BUY' THEN t.Price ELSE NULL END) AS AvgPurchasePrice,
    mp.ClosePrice AS CurrentPrice,
    (mp.ClosePrice - AVG(CASE WHEN t.TransactionType = 'BUY' THEN t.Price ELSE NULL END)) * 
    SUM(CASE WHEN t.TransactionType = 'BUY' THEN t.Quantity ELSE -t.Quantity END) AS UnrealizedGainLoss
FROM
    Transactions t
    JOIN Assets a ON t.AssetID = a.AssetID
    JOIN MarketPrices mp ON t.AssetID = mp.AssetID
WHERE
    mp.PriceDate = '2024-08-30'
GROUP BY t.AssetID, a.TickerSymbol, mp.ClosePrice
HAVING RemainingQuantity > 0;

