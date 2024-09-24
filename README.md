# Investment Portfolio - Python|SQL|Tableau
### Project by - Arihant Bhuyan

---

## Table of Contents:
1. [Python Data Extraction for Investment Portfolio](#python-data-extraction-for-investment-portfolio)
2. [SQL Implementation for Investment Portfolio Project](#sql-implementation-for-investment-portfolio-project)
3. [Database Structure](#database-structure)
    1. [Assets Table](#1-assets-table)
    2. [AssetPrices Table](#2-assetprices-table)
    3. [Transactions Table](#3-transactions-table)
    4. [Asset Allocation Table](#4-asset-allocation-table)
    5. [MarketPrices Table](#5-marketprices-table)
4. [Trade Simulation and Transactions](#trade-simulation-and-transactions)
5. [Detailed Portfolio Analysis](#detailed-portfolio-analysis)
    1. [Unrealized Gains/Losses](#1-unrealized-gainslosses)
    2. [Realized Gains/Losses](#2-realized-gainslosses)
    3. [Diversification Strategy](#diversification-strategy)
6. [Portfolio Allocation by Asset Class](#portfolio-allocation-by-asset-class)
7. [Risk and Return](#risk-and-return)
8. [Portfolio Allocation by Asset Class with Asset-Level Performance Insights](#portfolio-allocation-by-asset-class-with-asset-level-performance-insights)
9. [Portfolio Performance Over Time Analysis](#portfolio-performance-over-time-analysis)
10. [Sharpe Ratio Analysis](#sharpe-ratio-analysis)
11. [Tableau: Detailed Analysis of Charts and Dashboard](#tableau-detailed-analysis-of-charts-and-dashboard)

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

Codes used are as below:
![image](https://github.com/user-attachments/assets/9f6dd49c-a921-4932-a413-4cee771ba3d8)

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
![image](https://github.com/user-attachments/assets/b45fe607-1c03-421e-9b3a-c95252d543ca)

This simulation helps model a year of portfolio activity, allowing for analysis of realized and unrealized gains/losses.
  
---

### Detailed Portfolio Analysis

#### 1. Unrealized Gains/Losses
- **AAPL (Apple Inc.):** Low to Moderate unrealized gains due to stable growth.
- **GOOGL (Alphabet Inc.):** Moderate gains from this strong tech performer. Less volatile than TSLA, providing portfolio stability.
- **SPY (S&P 500 ETF):** highest unrealised gains with low volatility due to more quantity of asset in the portfolio. SPY is a crucial defensive asset, reflecting overall market performance.
- **AGG (iShares Core US Aggregate Bond ETF):** low unrealized gains but acting as a buffer to reduce portfolio volatility.

![image](https://github.com/user-attachments/assets/a6193a4e-9834-41d3-abbd-a71ad39e553a)


#### 2. Realized Gains/Losses
Realized gains/losses were computed for assets that have been sold during the year. The timing of these trades plays a crucial role in the profitability of the portfolio.

![image](https://github.com/user-attachments/assets/8163b93b-5d5d-4a35-bb7a-d747a2c38a86)

---

### Portfolio Allocation by Asset Class
The portfolio was allocated across different asset classes, with each category playing a specific role:

- **Stocks**: High allocation in stocks like AAPL, TSLA, MSFT, and GOOGL. Keeping in mind thate they would perform well. They contributed significantly to both realized and unrealized gains but also contributed heavily to losses (TSLA).
- **ETFs and Bonds**: These represented a more conservative allocation. While they yielded high returns, they stabilized the portfolio, particularly during volatile periods.
- **Commodities**: Gold (GLD) was included for hedging purposes, particularly against inflation and stock market downturns. It showed modest gains but played a crucial defensive role.

#### Diversification Strategy
The portfolio was designed to have a balanced growth strategy in mind, exploring high-growth tech stocks with more stable assets such as bonds and index funds. This helps in managing risk, especially during volatile market periods. Here’s how different asset categories contributed to this strategy:

- **Equity (Tech Stocks)**: Stocks like AAPL, TSLA, GOOGL, and MSFT were tend to represent the growth-oriented part of the portfolio. While they introduced volatility, they also provided the highest potential for returns.
- **ETFs**: SPY and QQQ provides a balanced exposure to broader markets, reducing the risks associated with individual stock holdings. SPY, which mirrors the S&P 500, offered more stability, while QQQ capitalized on the technology sector’s performance.
- **Bonds**: AGG acted as a safety net. Bonds usually move inversely to stocks, and AGG provided protection during market downturns, contributing to overall portfolio stability.
- **Mutual Funds**: VFINX contributed steady returns, similar to SPY, and served as a low-risk component, ideal for long-term growth.
- **Commodities**: GLD contributed high returns (unrealised and realised gains),served as a low-risk component, ideal for long-term growth.

### Portfolio Allocation by Asset Class with Asset-Level Insights

The provided SQL script calculates asset allocation and performance by asset category. Each asset’s total value is calculated using the closing price and the quantity held. Below states the purpose of choosing the said asset.

#### 1. Stocks:
- **AAPL, TSLA, MSFT, GOOGL**: These are high-growth tech stocks with significant exposure in the portfolio.
- **Purpose**: Tech stocks like AAPL and MSFT have strong historical returns but show high volatility. TSLA's growth has been exponential but is more volatile. GOOGL also offers long-term growth prospects.

#### 2. ETFs:
- **SPY, QQQ**: These ETFs represent broader indices like the S&P 500 and Nasdaq 100, providing stable and diversified growth across sectors.
- **Purpose**: SPY offers exposure to large-cap U.S. companies with moderate risk. QQQ is tech-heavy and volatile but historically performs well.

#### 3. Bonds:
- **AGG**: A bond ETF providing exposure to U.S. Treasuries and investment-grade corporate bonds.
- **Purpose**: AGG serves as a lower-risk counterbalance to stocks, providing stable income and reducing portfolio volatility.

#### 4. Mutual Funds:
- **VFINX**: Tracks the S&P 500 index and serves as a core diversified equity holding.
- **Purpose**: Historically offers consistent long-term growth aligned with the U.S. stock market.

#### 5. Commodities:
- **GLD**: A commodity ETF tracking gold.
- **Purpose**: Acts as a hedge against inflation and market downturns, offering protection during periods of economic uncertainty.

---

### Portfolio Performance Over Time Analysis:
- **Portfolio Value Fluctuation**: The portfolio value is calculated daily using the sum of asset quantities and their respective closing prices. For instance, on August 30, 2024, the portfolio's total value reached $852,288.49. Analyzing this data over time shows periods of growth and contraction, indicating asset performance.
- **Volatility (Risk)**: Individual asset volatility is calculated using the standard deviation of asset prices. For example, AssetID 5 (SPY) exhibits a 42.64 volatility, one of the highest in the portfolio, indicating a riskier but potentially rewarding position. Conversely, AssetID 8 (AGG) has a 2.007 volatility, providing a more stable but lower-risk option.
- **Portfolio Volatility**: The weighted sum of each asset's volatility provides a portfolio volatility of 70.017. This suggests the portfolio is a high risk, high return portfolio risk.
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
![image](https://github.com/user-attachments/assets/b213a529-26c9-4904-b7ac-dd65326c298f)

---

## 2. Pie Chart: Asset Allocation
- **Assets Tracked**: ETF, Equity, Bonds, Mutual Funds, Commodities
- **Analysis**:
  - ETFs represent the largest portion of the portfolio, reflecting a strategy of diversification while ensuring exposure to broad markets.
  - Equity and Mutual Funds make up significant parts of the allocation, indicating the desire to capture growth.
  - Bonds and Commodities (e.g., Gold) serve as hedges against market volatility.
- **Insight**: The portfolio shows a balanced approach by holding high-growth assets (Equities) with safer assets like Bonds and Commodities, ensuring risk is managed while aiming for returns.

![image](https://github.com/user-attachments/assets/13902285-7e01-4642-8a3e-7cc90af3edce)

---

## 3. Bar Chart: Realized vs. Unrealized Gains
- **Assets Tracked**: All assets included—SPDR S&P 500 ETF, Gold, Tesla, Alphabet (Google), etc.
- **Analysis**:
  - SPDR S&P 500 ETF shows the highest unrealized gains, signaling its potential for future profit when sold.
  - Tesla exhibits unrealized losses, suggesting either a market dip or poor short-term performance, demanding closer observation.
  - Invesco QQQ Trust and Vanguard 500 Index Fund show healthy gains, showcasing their strength as part of long-term growth strategies.
  - Gold (SPDR Gold Shares), with significant realized gains, shows its role as a safety asset during downturns.
- **Insight**: By analyzing realized vs. unrealized gains, investors can assess which assets have future potential (like ETFs) versus those that may need repositioning, like Tesla.

![image](https://github.com/user-attachments/assets/c0c75309-b0cc-4b04-99bf-bf47e547216f)

---

## 4. Bubble Chart: Asset Volatility
- **Assets Tracked**: All assets based on size (volatility) and quantity.
- **Analysis**:
  - SPDR Gold Shares and SPDR S&P 500 ETF dominate the chart, indicating high volatility. This suggests that while they carry risks, they also offer significant return potential.
  - Tesla is also a high-volatility asset, reflecting its frequent price swings, making it attractive to risk-tolerant investors.
  - Bonds (like iShares Core US Aggregate Bond ETF) exhibit low volatility, making them stable investments in a volatile market.
- **Insight**: High-volatility assets like Tesla and SPDR S&P 500 ETF need constant attention for timing sell/buy decisions. Lower-volatility assets like Bonds are more stable, ideal for risk-averse investors.

![image](https://github.com/user-attachments/assets/16eec246-879a-4e39-953d-dff3b3fd333c)

---

## 5. Investment Holdings Table
- **Assets Tracked**: SPDR S&P 500 ETF Trust, Gold, Alphabet, Tesla, Microsoft, Vanguard, etc.
- **Analysis**:
  - SPDR S&P 500 ETF is the largest holding, with 45.29% of equity and an impressive unrealized gain of ₹6,202.30. This solidifies its position as a reliable, long-term performer.
  - Tesla Inc. shows significant unrealized losses (-₹635.70), hinting at potential overvaluation or short-term market corrections.
  - Gold (SPDR Gold Shares), with ₹5,022.66 in unrealized gains, is serving its purpose as a hedge against market risk.
- **Insight**: SPDR S&P 500 ETF and Gold are strong performers, while Tesla may require rebalancing to manage portfolio risk. Keeping track of these metrics helps make informed buy/sell decisions.
![image](https://github.com/user-attachments/assets/f3b5b54a-4e4f-4533-8973-ec61389a4364)

---

## 6. Dashboard Overview: Interactivity and Filters
- **Interactivity**: Filters allow users to select specific assets (like SPDR S&P 500 ETF, Tesla, iShares Bond ETF, etc.) and track their performance over time. The month/date filters provide detailed insights, helping to analyze short-term vs. long-term performance.
- **Insight**: The interactivity allows users to focus on asset-specific trends, making the dashboard highly useful for personalized decision-making. Investors can use these insights to adjust their strategy in real-time, based on the latest data.
![image](https://github.com/user-attachments/assets/4ce24fff-6ef0-4789-a3ea-e9c2075b9dd3)

---

## Conclusion:
This dashboard, with its multiple charts and filters, provides a comprehensive view of the portfolio. It allows for an in-depth analysis of each asset, helping to track performance, risk (volatility), and realized/unrealized gains. The interactivity of the filters (asset selection, time period) adds flexibility for investors to make informed, data-driven decisions. Assets like SPDR S&P 500 ETF and Gold offer stability, while Tesla highlights the risk of high volatility.

