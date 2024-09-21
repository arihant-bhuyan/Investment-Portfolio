# Investment Portfolio - Python|SQL|Tableau
### Project by - Arihant Bhuyan
---
# Python Data Extraction for Investment Portfolio Project

This script automates the extraction and preparation of historical stock data for key tickers, utilizing the `yfinance` library to fetch and clean data for various financial instruments.

## Key Features:

### 1. Installation:
- Required packages such as `yfinance` for data retrieval and `pandas` for data manipulation are installed.

### 2. Tickers Monitored:
- Data is retrieved for multiple tickers, including:
  - AAPL, TSLA, MSFT, GOOGL, SPY, QQQ, VFINX, AGG, GLD

### 3. Data Cleaning Process:
- Unnecessary columns such as 'Adj Close' are removed.
- Missing data rows are dropped to ensure clean datasets.

### 4. Data Storage:
- Cleaned data for each ticker is saved into CSV files, making it ready for further analysis.
  
---

# SQL Implementation for Investment Portfolio Project

This part of the project is designed to analyze an investment portfolio by storing data on various financial assets, their historical prices, transactions, and portfolio allocation. The project involves creating a relational database to manage asset data and then extracting, cleaning, and loading data using Python and SQL.

---

## Database Structure

The project starts by creating a database, InvestmentPortfolio, which contains several key tables:

### 1. Assets Table
- Contains details of portfolio assets, including `AssetType`, `TickerSymbol`, `AssetName`, and `AssetCategory`. Examples include:
  - Stocks: AAPL (Apple Inc.), TSLA (Tesla Inc.)
  - ETFs: SPY (S&P 500)

### 2. AssetPrices Table
- Stores historical pricing data (`open`, `high`, `low`, `close`, `volume`) for each asset, linked with `AssetID`.

### 3. Transactions Table
- Logs all transactions (buy/sell) of assets with information such as `TransactionDate`, `Quantity`, and `TransactionType`. 
- Useful for calculating realized gains/losses and simulating portfolio performance.

### 4. Asset Allocation Table
- Records portfolio allocation percentage for each asset, ensuring the total allocation remains <= 100%.
- Crucial for tracking and rebalancing the portfolio.

### 5. MarketPrices Table
- Stores daily closing prices for each asset to determine current market value and calculate gains/losses.

---

## SQL Implementation
- SQL DDL commands define the database structure, with relationships created using primary and foreign keys.
- Referential integrity is maintained using constraints such as `ON DELETE CASCADE`.

### Data Insertion and Cleaning

1. **Asset Data Insertion:** 
   - Data for assets like AAPL, MSFT, TSLA, SPY are inserted into the `Assets` table.
   
2. **Price Data Loading:**
   - Historical price data is imported into `AssetPrices` using the SQL import wizard.

3. **Data Extraction Using Python:**
   - Data for tickers is extracted using Python’s `yfinance` API, cleaned, and saved into CSV files for further SQL analysis.
  
---

### Trade Simulation and Transactions

- A stored procedure, `AddTransaction`, automates transaction recording by retrieving asset closing prices from the `AssetPrices` table and logging the transactions.
  
#### Simulated Transactions:
- Example trades:
  - Buy 10 shares of AAPL on 2023-09-01.
  - Sell 5 shares of TSLA on 2023-09-25.
  
This simulation helps model a year of portfolio activity, allowing for analysis of realized and unrealized gains/losses.
  
---

### Detailed Portfolio Analysis

#### 1. Unrealized Gains/Losses
- **AAPL (Apple Inc.):** Significant unrealized gains due to stable growth. AAPL forms a core portfolio asset.
- **TSLA (Tesla Inc.):** Volatility results in moderate unrealized gains, but Tesla remains a high-risk, high-reward asset.
- **GOOGL (Alphabet Inc.):** Moderate gains from this strong tech performer. Less volatile than TSLA, providing portfolio stability.
- **SPY (S&P 500 ETF):** Steady gains with low volatility. SPY is a crucial defensive asset, reflecting overall market performance.
- **AGG (iShares Core US Aggregate Bond ETF):** Stable unrealized gains, acting as a buffer to reduce portfolio volatility.

#### 2. Realized Gains/Losses
Realized gains/losses were computed for assets that have been sold during the year. The timing of these trades plays a crucial role in the profitability of the portfolio.

- **AAPL**: The realized gains from selling AAPL reflect timely buy and sell decisions, leveraging the stock’s bullish trend. Selling AAPL after its consistent rise contributed significantly to portfolio profits.
- **TSLA**: Tesla’s realized losses were due to its volatility. Although some trades were profitable, others resulted in small realized losses due to sales during price dips.
- **VFINX (Vanguard 500 Index Fund)**: Realized gains from VFINX were steady, reflecting its stable performance as an index fund. VFINX is ideal for long-term investors looking to capitalize on overall market growth with low risk.
- **SPY & QQQ (Invesco QQQ Trust)**: Both ETFs showed decent performance, especially QQQ, which focuses on the tech-heavy Nasdaq. These trades helped enhance the overall portfolio return, with QQQ benefiting from its tech exposure.

#### Diversification Strategy
The portfolio was designed with a diversified strategy in mind, balancing high-growth tech stocks with more stable assets such as bonds and index funds. This helps in managing risk, especially during volatile market periods. Here’s how different asset categories contributed to this strategy:

- **Equity (Tech Stocks)**: Stocks like AAPL, TSLA, GOOGL, and MSFT represented the growth-oriented part of the portfolio. While they introduced volatility, they also provided the highest potential for returns.
- **ETFs**: SPY and QQQ provided a balanced exposure to broader markets, reducing the risks associated with individual stock holdings. SPY, which mirrors the S&P 500, offered more stability, while QQQ capitalized on the technology sector’s performance.
- **Bonds**: AGG acted as a safety net. Bonds usually move inversely to stocks, and AGG provided protection during market downturns, contributing to overall portfolio stability.
- **Mutual Funds**: VFINX contributed steady returns, similar to SPY, and served as a low-risk component, ideal for long-term growth.
  
---

### Portfolio Allocation by Asset Class
The portfolio was allocated across different asset classes, with each category playing a specific role:

- **Stocks**: High allocation in stocks like AAPL, TSLA, MSFT, and GOOGL. This contributed significantly to both realized and unrealized gains but also added volatility.
- **ETFs and Bonds**: These represented a more conservative allocation. While they didn’t yield high returns, they stabilized the portfolio, particularly during volatile periods.
- **Commodities**: Gold (GLD) was included for hedging purposes, particularly against inflation and stock market downturns. It showed modest gains but played a crucial defensive role.

#### Risk and Return
- **Volatility**: Tesla (TSLA) and some tech stocks added a significant amount of volatility to the portfolio. However, this was balanced by the inclusion of bonds (AGG) and ETFs (SPY, QQQ).
- **Risk Mitigation**: The inclusion of bonds and commodity ETFs (GLD) helped cushion against market downturns. While bonds tend to have lower returns, they reduce the portfolio’s overall risk.
- **Return Maximization**: The high-growth tech stocks (AAPL, TSLA, GOOGL) were the primary drivers of the portfolio’s performance. Though they carried more risk, they offered the highest potential for gains.

#### Conclusion and Strategic Insights
This portfolio showcases a balanced approach that mixes high-risk, high-reward stocks with stable, low-risk assets like bonds and index funds. The insights derived from realized and unrealized gains/losses emphasize the importance of timely trades and diversification to manage risk while maximizing returns.

#### Key Takeaways:
- Diversification across sectors and asset types mitigates risks and smooths out returns during volatile periods.
- Realized gains from trades like AAPL highlight the importance of timing in portfolio management.
- Unrealized gains show potential for further profits, particularly from stable stocks like AAPL and GOOGL.
  
---

### Portfolio Allocation by Asset Class with Asset-Level Performance Insights

The provided SQL script calculates asset allocation and performance by asset category. Each asset’s total value is calculated using the closing price and the quantity held. Here’s an asset-level breakdown of performance:

#### 1. Stocks:
- **AAPL, TSLA, MSFT, GOOGL**: These are high-growth tech stocks with significant exposure in the portfolio.
- **Performance**: Tech stocks like AAPL and MSFT have strong historical returns but show high volatility. TSLA's growth has been exponential but is more volatile. GOOGL also offers long-term growth prospects.

#### 2. ETFs:
- **SPY, QQQ**: These ETFs represent broader indices like the S&P 500 and Nasdaq 100, providing stable and diversified growth across sectors.
- **Performance**: SPY offers exposure to large-cap U.S. companies with moderate risk. QQQ is tech-heavy and volatile but historically performs well.

#### 3. Bonds:
- **AGG**: A bond ETF providing exposure to U.S. Treasuries and investment-grade corporate bonds.
- **Performance**: AGG serves as a lower-risk counterbalance to stocks, providing stable income and reducing portfolio volatility.

#### 4. Mutual Funds:
- **VFINX**: Tracks the S&P 500 index and serves as a core diversified equity holding.
- **Performance**: Historically offers consistent long-term growth aligned with the U.S. stock market.

#### 5. Commodities:
- **GLD**: A commodity ETF tracking gold.
- **Performance**: Acts as a hedge against inflation and market downturns, offering protection during periods of economic uncertainty.

---

### Portfolio Performance Over Time Analysis:
- **Portfolio Value Fluctuation**: The portfolio value is calculated daily using the sum of asset quantities and their respective closing prices. For instance, on August 30, 2024, the portfolio's total value reached $852,848.49. Analyzing this data over time shows periods of growth and contraction, indicating asset performance.
- **Volatility (Risk)**: Individual asset volatility is calculated using the standard deviation of asset prices. For example, AssetID 6 (QQQ) exhibits a 42.64 volatility, one of the highest in the portfolio, indicating a riskier but potentially rewarding position. Conversely, AssetID 10 (VFINX) has a 33.54 volatility, providing a more stable but lower-risk option.
- **Portfolio Volatility**: The weighted sum of each asset's volatility provides a portfolio volatility of 18.11. This moderate risk suggests a balanced portfolio, blending higher-risk assets like AAPL (AssetID 1) and lower-risk ones like GLD (AssetID 8).
- **Daily Returns and Average Return**: The average return calculation is based on daily price movements. For example, from August 2023 to August 2024, the portfolio averaged a 7.65% return. This consistent growth, especially driven by the high returns from TSLA (AssetID 2) and SPY (AssetID 9), demonstrates solid portfolio performance.

---

### Sharpe Ratio Analysis:
- The Sharpe Ratio is a measure used to assess the performance of an investment portfolio by adjusting its returns for risk. It is calculated by subtracting the risk-free rate from the portfolio's return and dividing that by the portfolio's volatility.
- **Sharpe Ratio Calculation**: With a portfolio volatility of 18.11 and an average portfolio return of 7.65%, using a 3% risk-free rate results in a Sharpe Ratio of 0.66.
- This ratio suggests that for every unit of risk taken, the portfolio earns 0.66 units of excess return. A ratio above 1 is considered ideal, indicating the portfolio is producing efficient risk-adjusted returns. However, with 0.66, it implies moderate performance relative to the risk taken. This provides a good balance but also suggests there is room for improvement in optimizing the portfolio, especially by either reducing volatility or enhancing returns through better asset allocation strategies.
- Further fine-tuning could involve reducing exposure to highly volatile assets like TSLA or QQQ and increasing allocation to lower-risk, consistent performers like VFINX or GLD.

---

# Tableau: Detailed Analysis of Tableau Charts and Dashboard
## 1. Line Graph: Transaction History and Asset Price Over Time
- **Assets Tracked (via Filters)**: Multiple assets are tracked, but the graph currently displays the iShares Core US Aggregate Bond ETF. However, it can be filtered for other assets like SPDR S&P 500 ETF, Tesla, etc.
- **Analysis for All Assets**:
  - SPDR S&P 500 ETF Trust shows consistent growth, with occasional dips, highlighting its position as a stable, long-term performer.
  - Tesla Inc. is volatile with noticeable fluctuations, typical for tech stocks, offering potential high returns but carrying significant risk.
  - SPDR Gold Shares reflects strong upward trends during economic uncertainty, making it a safe haven during market downturns.
- **Insight**: Analyzing assets like SPDR S&P 500 ETF and iShares Bond ETF can help in long-term stability, while Tesla’s performance requires active monitoring due to volatility. Gold provides safety against inflation.

---

## 2. Pie Chart: Asset Allocation
- **Assets Tracked**: ETF, Equity, Bonds, Mutual Funds, Commodities
- **Analysis**:
  - ETFs represent the largest portion of the portfolio, reflecting a strategy of diversification while ensuring exposure to broad markets.
  - Equity and Mutual Funds make up significant parts of the allocation, indicating the desire to capture growth.
  - Bonds and Commodities (e.g., Gold) serve as hedges against market volatility.
- **Insight**: The portfolio shows a balanced approach by holding high-growth assets (Equities) with safer assets like Bonds and Commodities, ensuring risk is managed while aiming for returns.

---

## 3. Bar Chart: Realized vs. Unrealized Gains
- **Assets Tracked**: All assets included—SPDR S&P 500 ETF, Gold, Tesla, Alphabet (Google), etc.
- **Analysis**:
  - SPDR S&P 500 ETF shows the highest unrealized gains, signaling its potential for future profit when sold.
  - Tesla exhibits unrealized losses, suggesting either a market dip or poor short-term performance, demanding closer observation.
  - Invesco QQQ Trust and Vanguard 500 Index Fund show healthy gains, showcasing their strength as part of long-term growth strategies.
  - Gold (SPDR Gold Shares), with significant realized gains, shows its role as a safety asset during downturns.
- **Insight**: By analyzing realized vs. unrealized gains, investors can assess which assets have future potential (like ETFs) versus those that may need repositioning, like Tesla.

---

## 4. Bubble Chart: Asset Volatility
- **Assets Tracked**: All assets based on size (volatility) and quantity.
- **Analysis**:
  - SPDR Gold Shares and SPDR S&P 500 ETF dominate the chart, indicating high volatility. This suggests that while they carry risks, they also offer significant return potential.
  - Tesla is also a high-volatility asset, reflecting its frequent price swings, making it attractive to risk-tolerant investors.
  - Bonds (like iShares Core US Aggregate Bond ETF) exhibit low volatility, making them stable investments in a volatile market.
- **Insight**: High-volatility assets like Tesla and SPDR S&P 500 ETF need constant attention for timing sell/buy decisions. Lower-volatility assets like Bonds are more stable, ideal for risk-averse investors.

---

## 5. Investment Holdings Table
- **Assets Tracked**: SPDR S&P 500 ETF Trust, Gold, Alphabet, Tesla, Microsoft, Vanguard, etc.
- **Analysis**:
  - SPDR S&P 500 ETF is the largest holding, with 45.29% of equity and an impressive unrealized gain of ₹6,202.30. This solidifies its position as a reliable, long-term performer.
  - Tesla Inc. shows significant unrealized losses (-₹635.70), hinting at potential overvaluation or short-term market corrections.
  - Gold (SPDR Gold Shares), with ₹5,022.66 in unrealized gains, is serving its purpose as a hedge against market risk.
- **Insight**: SPDR S&P 500 ETF and Gold are strong performers, while Tesla may require rebalancing to manage portfolio risk. Keeping track of these metrics helps make informed buy/sell decisions.

---

## 6. Dashboard Overview: Interactivity and Filters
- **Interactivity**: Filters allow users to select specific assets (like SPDR S&P 500 ETF, Tesla, iShares Bond ETF, etc.) and track their performance over time. The month/date filters provide detailed insights, helping to analyze short-term vs. long-term performance.
- **Insight**: The interactivity allows users to focus on asset-specific trends, making the dashboard highly useful for personalized decision-making. Investors can use these insights to adjust their strategy in real-time, based on the latest data.

---

## Conclusion:
This dashboard, with its multiple charts and filters, provides a comprehensive view of the portfolio. It allows for an in-depth analysis of each asset, helping to track performance, risk (volatility), and realized/unrealized gains. The interactivity of the filters (asset selection, time period) adds flexibility for investors to make informed, data-driven decisions. Assets like SPDR S&P 500 ETF and Gold offer stability, while Tesla highlights the risk of high volatility.

