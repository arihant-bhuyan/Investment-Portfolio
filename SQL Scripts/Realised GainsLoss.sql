-- Realized Gains/Losses (For Sold Positions)
-- For Each asset that was sold, we'll calculate the gain/loss using the formula 
-- Realized Gain/Loss=(Sell Price−Purchase Price)×Quantity Sold
Use investmentportfolio;
SELECT 
    t.AssetID,
    a.TickerSymbol,
    SUM((t.Price - b.Price) * t.Quantity) AS RealizedGainLoss
FROM
    Transactions t
    JOIN Assets a ON t.AssetID = a.AssetID
    JOIN Transactions b ON t.AssetID = b.AssetID
WHERE 
    t.TransactionType = 'SELL' AND b.TransactionType = 'BUY'
GROUP BY t.AssetID, a.TickerSymbol;

