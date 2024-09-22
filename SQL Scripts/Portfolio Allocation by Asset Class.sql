-- Portfolio Allocation by Asset Class:
SELECT 
    a.AssetCategory,
    SUM(mp.ClosePrice * t.Quantity) AS TotalValue,
    (SUM(mp.ClosePrice * t.Quantity) / 
     (SELECT SUM(mp2.ClosePrice * t2.Quantity)
      FROM Transactions t2
      JOIN MarketPrices mp2 ON t2.AssetID = mp2.AssetID
      WHERE mp2.PriceDate = '2024-08-30')) * 100 AS AllocationPercentage
FROM Transactions t
JOIN Assets a ON t.AssetID = a.AssetID
JOIN MarketPrices mp ON t.AssetID = mp.AssetID
WHERE mp.PriceDate = '2024-08-30'
GROUP BY a.AssetCategory;

