import java.util.*;

public class Player {
    private ArrayList<StockItem> stocks;
    private double money;
    private String username;

    public Player(String u, int i) {
	username = u;
	stocks = new ArrayList<String>();
	money = 100000.0;
	p = new PlayerCommunication();
    }

    public double getMoney() {
	return money;
    }

    public String getUsername() {
	return username;
    }

    public int getID() {
	return id;
    }

    public ArrayList<Stock> getPortfolio() {
	return stocks;
    }

    public void addMoney(double d) {
	money += d;
    }

    public Stock addStock(String s) {
	StockItem s = new StockItem(s, 0);
	stocks.add(s);
	return s;
    }

    public boolean hasStock(String s) {
	for (StockItem i : stocks) {
	    if (i.getSymbol().equals(s)) {
		return true;
	    }
	}
	return false;
    }

    public boolean buyStock(String s, int amt) { // The stock needs to already be in the stocks list
	for (StockItem s : stocks) {
	    if (s.getSymbol().equals(s)) {
		if (s.getCurrentPrice() * amt > money) {
		    return false;
		}
		else {
		    money -= s.getCurrentPrice() * amt;
		    s.addAmount(amt);
		    return false;
		}
	    }
	}
    }
}