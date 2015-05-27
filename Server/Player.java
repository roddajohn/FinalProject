import java.util.*;

public class Player {
    private ArrayList<Stock> stockNames;
    private ArrayList<Integer> stockAmts;
    private double money;
    private String username;
    private int id;

    public Player(String u, int i) {
	username = u;
	id = i;
	stocks = new ArrayList<String>();
	stockAmts = new ArrayList<Integer>();
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
	return stockNames;
    }

    public ArrayList<Integer> stockAmts() {
	return stockAmts;
    }

    public void addMoney(double d) {
	money += d;
    }
    
    // Maybe I should put all of the buying and selling code in here, which would make everything much cleaner and more effective.
    public void buyStock(String s, int amt) {
	
    }

}