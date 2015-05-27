import java.util.*;

public class Player {
    private ArrayList<String> stockNames;
    private ArrayList<Integer> stockAmts;
    private double money;
    private String username;
    private PlayerCommunication p;

    public Player(String u) {
	username = u;
	stocks = new ArrayList<String>();
	stockAmts = new ArrayList<Integer>();
	money = 100000.0;
	p = new PlayerCommunication();
    }

    public void buyStock(String s, int amt) {
	
    }

}