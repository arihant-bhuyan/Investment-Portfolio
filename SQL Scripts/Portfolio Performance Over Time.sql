-- Track Portfolio Performance Over Time
SELECT 
    mp.PriceDate,
    SUM(mp.ClosePrice * (SELECT SUM(CASE WHEN t.TransactionType = 'BUY' THEN t.Quantity ELSE -t.Quantity END)
                         FROM Transactions t
                         WHERE t.AssetID = mp.AssetID
                         AND t.TransactionDate <= mp.PriceDate)) AS PortfolioValue
FROM
    MarketPrices mp
GROUP BY mp.PriceDate
ORDER BY mp.PriceDate;

-- Risk Analysis (Volatility)
SELECT 
    AssetID,
    STDDEV(ClosePrice) AS PriceVolatility
FROM assetprices
GROUP BY AssetID;

-- Portfolio Volatility
SELECT 
    SUM(
        CASE AssetID
            WHEN 1 THEN (AssetValue / 85288.49) * 18.38
            WHEN 2 THEN (AssetValue / 85288.49) * 32.67
            WHEN 3 THEN (AssetValue / 85288.49) * 38.49
            WHEN 4 THEN (AssetValue / 85288.49) * 17.79
            WHEN 5 THEN (AssetValue / 85288.49) * 42.64
            WHEN 6 THEN (AssetValue / 85288.49) * 40.36
            WHEN 7 THEN (AssetValue / 85288.49) * 39.52
            WHEN 8 THEN (AssetValue / 85288.49) * 2.01
            WHEN 9 THEN (AssetValue / 85288.49) * 18.11
        END
    ) AS PortfolioVolatility
FROM (
    SELECT 
        t.AssetID,
        SUM(t.Quantity * ap.ClosePrice) AS AssetValue
    FROM Transactions t
    JOIN assetprices ap ON t.AssetID = ap.AssetID
    WHERE ap.PriceDate = '2024-08-30'
    GROUP BY t.AssetID
) AS AssetData;

-- Average Portfolio Return:
-- Step 1: Calculate Daily Returns
SELECT 
    mp.AssetID,
    mp.PriceDate,
    (mp.ClosePrice / LAG(mp.ClosePrice) OVER (PARTITION BY mp.AssetID ORDER BY mp.PriceDate) - 1) * 100 AS DailyReturn
FROM assetprices mp
WHERE mp.PriceDate <= '2024-08-30';

-- Step 2: Calculate Average Return
SELECT 
    AVG(DailyReturn) AS AverageReturn
FROM (
    SELECT 
        mp.AssetID,
        mp.PriceDate,
        (mp.ClosePrice / LAG(mp.ClosePrice) OVER (PARTITION BY mp.AssetID ORDER BY mp.PriceDate) - 1) * 100 AS DailyReturn
    FROM assetprices mp
    WHERE mp.PriceDate <= '2024-08-30'
) AS ReturnsData;

-- Sharpe Ratio =  (Average Portfolio Return−Risk-Free Rate) / Portfolio Volatility
-- Sharpe Ratio = (7.65% - 3%)/ 70.017 = 0.0664 = 6.64% as sharpe ratio
 
