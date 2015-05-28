import java.util.*;

public class Player {
    private ArrayList<Stock> stocks;
    private ArrayList<Integer> amounts;
    private double money;
    private String username;

    public Player(String u, int i) {
	username = u;
	stocks = new ArrayList<String>();
	amounts = new ArrayList<Integer>();
	money = 100000.0;
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

    public void addMoney(double d) {
	money += d;
    }

    public void addStock(Stock s) {
	stocks.add(s);
	amounts.add(0);
    }

    public boolean hasStock(String s) {
	for (Stock i : stocks) {
	    if (i.getSymbol().equals(s)) {
		return true;
	    }
	}
	return false;
    }

    public boolean buyStock(String s, int amt) { // The stock needs to already be in the stocks list
	for (int i = 0; i < stocks.size(); i++) {
	    if (stocks.get(i).getSymbol().equals(s)) {
		if (stocks.get(i).getCurrentPrice() * amt > money) {
		    return false;
		}
		else {
		    amounts.set(i, amounts.get(i) + stocks.get(i).getCurrentPrice() * amt);
		    money -= stocks.get(i).getCurrentPrice() * amt;
		    return true;
		}
	    }
	}
	return false;
    }

    public boolean sellStock(String s, int amt) {
	for (int i = 0; i < stocks.size(); i++) {
	    if (stocks.get(i).getSymbol().equals(s)) {
		if (amounts.get(i) < amt) {
		    return false;
		}
		else {
		    amounts.set(i, amounts.get(i) - amt);
		    money += stocks.get(i).getCurrentPrice() + amt;
		    return true;
		}
	    }
	}
	return false;
    }
}