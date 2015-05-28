import java.util.*;

public class Controller {
    private ArrayList<Player> players;
    private StockAPI api;

    public Controller() {
	api = new StockAPI();
	players = new ArrayList<Player>();
	loadPlayersFromFile();
	loadAPIFromFile();
	startServer();
    }

    private  void loadPlayersFromFile() {
	BufferedReader in = new BufferedReader(new FileReader("players.csv"));
	String line = "";
	while ((line = in.readLine()) != null) {
	    String[] input = line.split(",");
	    String[] stocks = input[3].split(";");
	    String[] amts = input[4].split(";");
	    ArrayList<Stock> s = new ArrayList<Stock>();
	    for (int i = 0; i < stocks.length; i++) {
		s.add(new Stock(stocks[i]));
	    }
	    ArrayList<Integer> j = new ArrayList<Integer>();
	    for (int i = 0; i < amts.length; i++) {
		j.add(Integer.parseInt(amts[i]));
	    }
	    players.add(new Player(input[0], input[1], Double.parseDouble(input[2]), s, j));
	}
	in.close();
    }

    private void loadAPIFromFile() {
	BufferedReader in = new BufferedReader(new FileReader("api.csv"));
	String line = "";
	while ((line = in.readLine()) != null) {
	    String[] input = line.split(",");
	    ArrayList<String> s = new ArrayList<String>();
	    for (int i = 0; i < input.length; i++) {
		s.add(input[i]);
	    }
	    api.importStock(s);
	}
	in.close();	
    }
    
    private void startServer() {
	// To be implemented, this will start the server
    }

    private boolean buyStock(Player p, String symbol, int amt) {
	if (!api.hasStock(symbol)) {
	    api.addStockToFollow(symbol);
	}
	if (!p.hasStock(symbol)) {
	    p.addStock(api.getStock(symbol));
	}
	return p.buyStock(symbol, amt);
    }

    private double sellStock(Player p, String symbol, int amt) {
	return p.sellStock(symbol, amt);
    }

    private void shutDown() {
	savePlayersToFile();
	saveStockAPIToFile();
	// This will shut down the server -- please also save all of the players states so that nothing breaks !  And/Or so that data isn't lost
    }

    private void savePlayersToFile() {
	PrintWriter writer = new PrintWriter("players.csv", "UTF-8");
	for (Player p : players) {
	    writer.println(p.toString());
	}
	writer.close();
	// Outputs the players to a file, to be loaded later
    }

    private void saveStockAPIToFile() {
	PrintWriter writer = new PrintWriter("api.csv", "UTF-8");
	writer.println(api.toString());
	writer.close();
	// Outputs the stockAPI to a file
    }
    
    private Player createUser(String username, String password) {
	// This will create a new user
    }

    private class ClientHandlingThread extends Thread { 
	private Player player;
	public ClientHandlinThread(Player p, Socket s) {
	    player = p;
	}

	public void run() {

	}
	// This is a class that will be created to deal with any client who has connected, the constructor will have a player passed in so that it know how do deal with that player.
    }

    private class CommandLine extends Thread {
	public CommandLine() {

	}

	public void run() {

	}
	// This takes input from the server command line to run commands, currently, only the shutDown() function
    }
}