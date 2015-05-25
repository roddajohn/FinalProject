public class Driver {
    public static void main(String[] args) {
	StockAPI a = new StockAPI();
	a.addStockToFollow("GOOG");
	a.addStockToFollow("AAPL");
	System.out.println(a.getStock("GOOG"));
	System.out.println(a.getStock("AAPL"));
	a.removeStockToFollow("GOOG");
	System.out.println(a.getStock("GOOG"));
   }
}