import java.util.*;

public class Player {
    private ArrayList<Stock> stockNames;
    private ArrayList<Integer> stockAmts;
    private double money;
    private String username;
    private PlayerCommunication p;
    private int id;

    public Player(String u, int i) {
	username = u;
	id = i;
	stocks = new ArrayList<String>();
	stockAmts = new ArrayList<Integer>();
	money = 100000.0;
	p = new PlayerCommunication();
    }

    public void buyStock(String s, int amt) {
	
    }

}