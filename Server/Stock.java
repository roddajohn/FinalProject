public class Stock {
    private String name, symbol, Comp1, Comp2, Comp3, Comp4, ED, EDD;
    private double currentValue, closeLastDay, openLastDay, BID, TargetEstimate, Beta, DaysRange, 52WeekVolume, Volume, AvgVolume, MarketCapitalization, EPS, DividendsandYield, P2SR,  FP2E, AEPS, QEPS, MeanReccomendations, PEGRatio;
    private double ExpectedTotalDifference;
    
    public void setExpectedTotalDifference(double d){
        ExectedTotalDifference = d;
        
    }
    public double getExpectedTotalDifference(){
        return ExpectedTotalDifference;
        
    }
    public Stock(String s) {
	symbol = s;
    }

    public void setCurrentValue(double d) {
	currentValue = d;
    }

    public void setCloseLastDay(double d) {
	closeLastDay = d;
    }

    public void setOpenLastDay(double d) {
	openLastDay = d;
  ;

    public Stock(String s) {
	symbol = s;
    }

    public void setCurrentValue(double d) {
	currentValue = d;
    }

    public void setCloseLastDay(double d) {
	closeLastDay = d;
    }

    public void setOpenLastDay(double d) {
	openLastDay = d;
    }

    public void setName(String s) {
	name = s;
    }

    public void setSymbol(String s) {
	symbol = s;
    }
    
    public void setBid(double d){
    Bid = d;      
    }
    
    public void set1YrTargetEstimate(double d){
	TargetEstimate = d;        
    }
    }

    public void setSymbol(String s) {
	symbol = s;
    }
    
    public void setBid(double d){
    Bid = d;      
    }
   
    
    public void setBeta(double d){
    Beta = d;
    }
    

    public void set1YrTargetEstimate(double d){
	TargetEstimate = d;        
    }
        public void setDaysRange(double d) {
    DaysRange = d;
        
    }
    
    public void set52WeekVolume(double d) {     
    52WeekVolume = d;
    }   }

    public void setName(String s) {
	name = s;
    }

    public void setSymbol(String s) {
	symbol = s;
    }
    
    public void setBid(double d){
    Bid = d;      
    }
    
    public void set1YrTargetEstimate(double d){
	TargetEstimate = d;        
    }
    
    public void setBeta(double d){
    Beta = d;
    }
    
    public void setDaysRange(double d) {
    DaysRange = d;
        
    }
    
    public void set52WeekVolume(double d) {     
    52WeekVolume = d;
    }
    
    public void setVolume(double d) {
    Volume = d;
    }
    
    public void setAvgVolume(double d) {
    AvgVolume = d; 
    }
    
    public void setMarketCapitalization(double d) {
    MarketCapitalization = d;
    }
    
    public void setEPS(double d) {
    EPS = d;
    }
    
    public void setDividendsandYield(double d) {
    DividendsandYield = d;   
    }
    
    public void setPricetoSalesRatio(double d) {
    P2SR = d;    
    }
    
    public void setForwardPricetoEarnings(double d){
    FP2E = d;
    }
    
    public void setCompetitors(String a, String b, String c, String d) {
    Comp1 = a;
    Comp2 = b;
    Comp3 = c;
    Comp4 = d;
	}
    
    public void setEarningsDate(String date) {
    ED = date;
    }
    public void setExDividendDate(String date){
    EDD = date;  
    }
    
    public void setAnnualEarningsperShare(double d) {
    AEPS = d;
    }
    
    public void setQuarterlyEarningsPerShareEstimated(double d) {
    QEPS = d;
    }
    
    public void setMeanReccomendation(double d) {
    MeanReccomendation = d;
    }
    
    public void setPEGRatio(double d) {
    PEGRatio = d;
    }
    
	



    public String getSymbol() {
	return symbol;
    }

    public String getName() {
	return name;
    }

    public double getCurrentValue() {
	return currentValue;
    }

    public double getCloseLastDay() {
	return closeLastDay;
    }

    public double getOpenLastDay() {
	return openLastDay;
    }

    
    public double getBid() {
    return BID;
    }

    public double get1YrTargetEstimate() {
    return 52WeekVolume;
    }

	public double getBeta(){
    return Beta;
	}

public double getDaysRange() {
    return DaysRange;
}

public double get52WeekVolume() {
    return 52WeekVolume;
}

public double getVolume() {
    return Volume;
}

public double getAvgVolume() {
    return AvgVolume;
}

public double getMarketCapitalization(){
    return MarketCapitalization;
}

public double getEPS() {
    return EPS;
}

public double getDividendsandYield() {
    return DividendsandYield;
}

public double getPricetoSalesRatio() {
    return P2SR;
}


    
    public double getForwardPricetoEarnings(){
        return P2SR;
    }

public String getCompetitors() {
    return Comp1 + " " + Comp2 + " " + Comp3 + " " + Comp4;
}
public String getEarningsDate() {
    return ED;
}

public String getExDividendDate() {
    return EDD;
}

public double getAnnualEarningsperShare() {
    return AEPS;
}

public double getQuarterlyEarningsPerShareEstimated() {
    return QUEPS;
}

public double getMeanReccomendation() {
    return MeanReccomendation;
}

public double getPEGRatio() {
    return PEGRatio;
}

    public String toString() {
	String toReturn = "";
	toReturn += name + " Current Price: " + currentValue;
	return toReturn;
    }
}