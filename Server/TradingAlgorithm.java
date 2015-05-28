 public class TradingAlgorithm{
  private Stock stock1;
  private boolean currentValue, closeLastDay, openLastDay, BID, TargetEstimate, Beta, DaysRange, 52WeekVolume, Volume, AvgVolume, MarketCapitalization, EPS, DividendsandYield, P2SR,  FP2E, AEPS, QEPS, MeanReccomendations, PEGRatio;
 
private boolean currentValue1, closeLastDay1, openLastDay1, BID1, TargetEstimate1, Beta1, DaysRange1, 52WeekVolume1, Volume1, AvgVolume1, MarketCapitalization1, EPS1, DividendsandYield1, P2SR1,  FP2E1, AEPS1, QEPS1, MeanReccomendations1, PEGRatio1; 
     private ArrayList<Stocks> StocksConsidered;
     
     public TradingAlgorithm(){
         StocksConsidered = StockAPI.getStocks;
                 
     }
     
     public StockTrades(){
         int Min = (StocksConsidered.get(0)).getExpectedDifference();
         int Max = (StocksConsidered.get(0)).getExpectedDifference();
         
         for (int i = 0; i < StocksConsidered.size(); i++){
             if (StocksConsidered.get(i) < Min){
                 Min = StocksConsidered.get
                 
                 
             }
             
             
         }
         
         
         
     }
     
     
     
     public boolean CVDifference(){
         
     }
 }