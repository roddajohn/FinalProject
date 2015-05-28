Documentation:

Stock Class:
	public Stock(String s) -- s is the symbol of the stock
	public void setCurrentValue(double d) -- sets the current value of the stock
	public void setCloseLastDay(double d) -- sets the closing value of the last trading day
	public void setOpenLastDay(double d) -- sets the opening value of the last trading day 
	public void setName(String n) -- sets the name of the stock, exp. "Google Inc."
	public void setSymbol(String s) -- sets the symbol of the stock, WARNING: Do not change, it will probably mess up updating thread things
    public void setBid(double d) -- sets the bid for the stock
    public void set1YrTargetEstimate(double d) -- sets the 1YR target estimate for the stock
    public void setBeta(double d) -- sets the beta value for the pack
    public void setDaysRange(double d) -- sets the Day`s range
    public void set52WeekVolume(double d) -- sets the 52 Week Volume
    public void setVolume(double d) -- sets the volume
    public void setAvgVolume(double d) -- sets the Average Volum over 3 months
    public void setMarketCapitalization(double d) -- sets the market capitalization
    public void setEPS(double d) -- sets the Earnings per Share
    public void setDividendsandYield(double d) -- sets the Dividends and yield
    public void setPricetoSalesRatio(double d) -- sets the Price to Sales Ratio
    public void setForwardPricetoEarnings -- sets the Forward Price to Earnings
    public void setCompetitors(String a, String b, String c, String d) -- sets the firms top four competitors
    public void setEarningsDate(String date) -- sets the earnings date
    public void setExDividendDate(String date) -- sets the ex -dividend date
    public void setAnnualEarningsperShare(double d) -- sets the Annual Earnings per Share
    public void setQuarterlyEarningsPerShareEstimated(double d) -- sets the estimated, quarterly earnings per share
    public void setMeanReccomendation(double d) -- sets the mean recomendation
    public void setPEGRatio(double d) -sets the PEG ratio
    
	
	public String getSymbol() -- returns the symbol of the stock
	public double getCurrentValue() -- returns the currentValue of the stock
	public double getCloseLastDay() -- returns the value of the stock at the close of the last trading day
	public double getOpenLastDay() -- returns the value of the stock at the opening of the last trading day
	public double getBid() -- gets the bid for the stock
    public double get1YrTargetEstimate() -- gets the 1YR target estimate for the stock
    public double getBeta() -- gets the beta value for the pack
    public double getDaysRange() -- gets the Day`s range
    public double get52WeekVolume() -- gets the 52 Week Volume
    public double getVolume() -- gets the volume
    public double getAvgVolume() -- gets the Average Volum over 3 months
    public double getMarketCapitalization() -- gets the market capitalization
    public double getEPS() -- gets the Earnings per Share
    public double getDividendsandYield() -- gets the Dividends and yield
    public double getPricetoSalesRatio() -- gets the Price to Sales Ratio
    public double getForwardPricetoEarnings() -- gets the Forward Price to Earnings
    public String getCompetitors() -- gets the firms top four competitors
    public String getEarningsDate() -- gets the earnings date
    public String getExDividendDate() -- gets the ex -dividend date
    public double getAnnualEarningsperShare() -- gets the Annual Earnings per Share
    public double getQuarterlyEarningsPerShareEstimated() -- gets the estimated, quarterly earnings per share
    public double getMeanReccomendation() -- gets the mean recomendation
    public double getPEGRatio() -gets the PEG ratio
	       
	public String toString() -- Prints out a stock's name followed by its current price, ie: "Google Inc. Current Price: -1.1"
    
    

	
StockAPI Class:
	This is a class which keeps track of a list of Stock objects, it updates their values every 10 seconds.
	public StockAPI() -- default constructor
	public Stock getStock(String s) -- This will return a Stock object with a current value (+- 10 seconds).  If you are not following that stock, it will retrieve the value but will NOT add 
	 	it to the list of following stocks -- note this forces a refresh.
	public void addStockToFollow(String symbol) -- This adds a stock to the list of stocks to follow
	public void removeStockToFollow(String symbol) -- This removes a stock from the list of stocks to follow
	public boolean hasStock(String symbol) -- This returns true iff the API is following a stock with a given symbol and false if it is not being followed.
