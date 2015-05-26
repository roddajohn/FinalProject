import java.util.*;

public class Player {
    private ArrayList<ArrayList<Stock>> stocks;
    private double money;
    private String username;

    public Player(String u) {
	username = u;
	stocks = new ArrayList<ArrayList<Stock>>();
	money = 100000.0;
    }
}