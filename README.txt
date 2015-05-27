Documentation:

Stock Class:
	public Stock(String s) -- s is the symbol of the stock
	public void setCurrentValue(double d) -- sets the current value of the stock
	public void setCloseLastDay(double d) -- sets the closing value of the last trading day
	public void setOpenLastDay(double d) -- sets the opening value of the last trading day 
	public void setName(String n) -- sets the name of the stock, exp. "Google Inc."
	public void setSymbol(String s) -- sets the symbol of the stock, WARNING: Do not change, it will probably mess up updating thread things
    public void setBid(double d) -- sets the bid for the stock
    public void set1YrTargetEstimate
	
	public String getSymbol() -- returns the symbol of the stock
	public double getCurrentValue() -- returns the currentValue of the stock
	public double getCloseLastDay() -- returns the value of the stock at the close of the last trading day
	public double getOpenLastDay() -- returns the value of the stock at the opening of the last trading day
    public void getBid() -- sets the bid for the stock
	       
	public String toString() -- Prints out a stock's name followed by its current price, ie: "Google Inc. Current Price: -1.1"
    
    
    Metrics

Bid
Ask
1 year Target Estimate
Beta
Day's Range
52 Week Range
Volume
Avg Volume (3 Months)
Market Capitalization:
Price to Earnings Ratio:
Earnings Per Share:
Dividends and Yield:
Price to Sales Ratio
Forward Price to Earnings (1 Year):



Comparison of Competitors
Get top 4 competitors names and links


Non-Variable Info
Earnings Date
Ex- Dividend Date:

Analysts: 
Annual Earnings per Share

	
StockAPI Class:
	This is a class which keeps track of a list of Stock objects, it updates their values every 10 seconds.
	public StockAPI() -- default constructor
	public Stock getStock(String s) -- This will return a Stock object with a current value (+- 10 seconds).  If you are not following that stock, it will retrieve the value but will NOT add 
	 	it to the list of following stocks -- note this forces a refresh.
	public void addStockToFollow(String symbol) -- This adds a stock to the list of stocks to follow
	public void removeStockToFollow(String symbol) -- This removes a stock from the list of stocks to follow
	public boolean hasStock(String symbol) -- This returns true iff the API is following a stock with a given symbol and false if it is not being followed.
