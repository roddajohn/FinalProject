Documentation:

Stock Class:
	public Stock(String s) -- s is the symbol of the stock
	public void setCurrentValue(double d) -- sets the current value of the stock
	public void setCloseLastDay(double d) -- sets the closing value of the last trading day
	public void setOpenLastDay(double d) -- sets the opening value of the last trading day 
	public void setName(String n) -- sets the name of the stock, exp. "Google Inc."
	public void setSymbol(String s) -- sets the symbol of the stock, WARNING: Do not change, it will probably mess up updating thread things
	
	public String getSymbol() -- returns the symbol of the stock
	public double getCurrentValue() -- returns the currentValue of the stock
	public double getCloseLastDay() -- returns the value of the stock at the close of the last trading day
	public double getOpenLastDay() -- returns the value of the stock at the opening of the last trading day
	       
	public String toString() -- Prints out a stock's name followed by its current price, ie: "Google Inc. Current Price: -1.1"
	
StockAPI Class:
	This is a class which keeps track of a list of Stock objects, it updates their values every 10 seconds.
	public StockAPI() -- default constructor
	public Stock getStock(String s) -- This will return a Stock object with a current value (+- 10 seconds).  If you are not following that stock, it will retrieve the value but will NOT add 
	 	it to the list of following stocks -- note this forces a refresh.
	public void addStockToFollow() -- This adds a stock to the list of stocks to follow
	public void removeStockToFollow() -- This removes a stock from the list of stocks to follow
