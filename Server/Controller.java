import java.util.*;

public class Controller {
    private ArrayList<Player> players;

    public Controller() {
	players = new ArrayList<Player>();
	loadPlayersFromFile();
	startServer();
    }

    private  void loadPlayersFromFile() {
	// To be implemented, this will, when the Controller is created, load all of the players from the file storing all of the players.
    }
    
    private void startServer() {
	// To be implemented, this will start the server
    }

    private boolean buyStock(Player p, String symbol, int amt) {
	// For buying stock, this takes the player that needs to buy the stock, the symbol of the stock to buy, and the amount of stocks to buy
	// This will return true if the buy was successful and false if it wasn't
	
    }

    private double sellStock(Player p, String symbol, int amt) {
	// Selling, returns the amount of money added to the account
    }

    private void shutDown() {
	// This will shut down the server
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