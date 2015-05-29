import java.util.*;
import java.net.*;
import java.io.*;

public class Controller {
    private ArrayList<Player> players;
    private StockAPI api;
    private ArrayList<ClientHandlingThread> threads;

    public Controller() {
	api = new StockAPI();
	players = new ArrayList<Player>();
	threads = new ArrayList<ClientHandlingThread>();
	loadPlayersFromFile();
	loadAPIFromFile();
	startServer();
    }

    private void loadPlayersFromFile() {
	BufferedReader in = null;
	try {
	    in = new BufferedReader(new FileReader("players.csv"));
	}
	catch (FileNotFoundException e) {
	    e.printStackTrace();
	}
	String line = "";
	try {
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
	catch (IOException e) {
	    e.printStackTrace();
	}
    }

    private void loadAPIFromFile() {
	BufferedReader in = null; 
	try {
	    in = new BufferedReader(new FileReader("api.csv"));
	}
	catch (FileNotFoundException e) {
	    e.printStackTrace();
	}
	String line = "";
	try {
	    while ((line = in.readLine()) != null) {
		String[] input = line.split(",");
		ArrayList<Stock> s = new ArrayList<Stock>();
		for (int i = 0; i < input.length; i++) {
		    s.add(new Stock(input[i]));
		}
		api.importStock(s);
	    }
	    in.close();
	}
	catch (IOException e) {
	    e.printStackTrace();
	}	
    }
    
    private void startServer() {
	ServerSocket socket = null;
	ArrayList<ClientHandlingThread> threads = new ArrayList<ClientHandlingThread>();
	
	try {
	    socket = new ServerSocket(23456);
	}
	catch (IOException e) {
	    e.printStackTrace();
	}
	
	Socket client = null;
	while (1 == 1) {
	    try {
		client = socket.accept();
	    }
	    catch (IOException e) {
		e.printStackTrace();
	    }
	    catch (NullPointerException e) {
		e.printStackTrace();
	    }
	}
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

    private boolean sellStock(Player p, String symbol, int amt) {
	return p.sellStock(symbol, amt);
    }

    private void shutDown() {
	savePlayersToFile();
	saveStockAPIToFile();
	// This will shut down the server -- please also save all of the players states so that nothing breaks !  And/Or so that data isn't lost
    }

    private void savePlayersToFile() {
	PrintWriter writer = null;
	try {
	    writer = new PrintWriter("players.csv", "UTF-8");
	    for (Player p : players) {
		writer.println(p.toString());
	    }
	    writer.close();
	}
	catch (IOException e) {
	    e.printStackTrace();
	}
	// Outputs the players to a file, to be loaded later
    }

    private void saveStockAPIToFile() {
	PrintWriter writer = null;
	try {
	    writer = new PrintWriter("api.csv");
	}
	catch(FileNotFoundException e) {
	    e.printStackTrace();
	}
	writer.println(api.toString());
	writer.close();
	// Outputs the stockAPI to a file
    }
    
    private Player createUser(String username, String password) {
	// This will create a new user
	Player p = new Player(username, password);
	players.add(p);
	return p;
    }

    private void quitThread(ClientHandlingThread c) {
	threads.remove(c);
    }

    private class ClientHandlingThread extends Thread { 
	private Player player;
	private Socket socket;
	public ClientHandlingThread(Socket s) {
	    socket = s;
	}

	public void run() {
	    BufferedReader in = null;
	    PrintWriter out = null;
	    try {
		in = new BufferedReader(new InputStreamReader(socket.getInputStream()));
		out = new PrintWriter(socket.getOutputStream(), true);
	    
	    }
	    catch (IOException e) {
		e.printStackTrace();
	    }
	    String inputLine = "";
	    try {
		while((inputLine = in.readLine()) != null) {
		    String[] input = inputLine.split(":");
		    if (input[0].equals("logout")) {
			break;
		    }
		    if (input[0].equals("newUser")) {
			player = createUser(input[1], input[2]);
			break;
		    }
		    else if (input[0].equals("login")) {
			for (Player p : players) {
			    if (p.getUsername().equals(input[1]) && p.getPassword().equals(input[2])) {
				player = p;
				break;
			    }
			}
			out.println("tryAgain");
		    }
		    else {
			out.println("error");
		    }
		}
	    }
	    catch (IOException e) {
		e.printStackTrace();
	    }
		
	    try {
		socket.close();
		out.close();
		in.close();
	    }
	    catch (IOException e) {
		e.printStackTrace();
	    }
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