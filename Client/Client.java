import java.net.*;
import java.io.*;
import java.util.*;

public class Client {
    private final String serverAddress = "127.0.0.1";
    private final int port = 55561;

    public Client() {
	
    }

    public void runClient() {
	Socket serverSocket = null; // Sets up the socket, out and in variables                                                                                                                             
        PrintWriter out = null;
        BufferedReader in = null;

        try {
            serverSocket = new Socket(serverAddress, port);
            out = new PrintWriter(serverSocket.getOutputStream(), true);
	    in = new BufferedReader(new InputStreamReader(serverSocket.getInputStream()));
        }
        catch (UnknownHostException e) {
            e.printStackTrace();
        }
        catch (IOException e) {
            e.printStackTrace();
        }

        Scanner console = new Scanner(System.in);
	String input = "";
	System.out.print("input: ");
	try {
	    while ((input = console.nextLine()) != null) {
		out.println(input);
		System.out.println("Waiting for input");
		System.out.println("Server: " + in.readLine());
		System.out.print("input: ");
	    }
	}
	catch (IOException e) {
	    e.printStackTrace(); // Exception handling                                                                                                                                                  
	}

	try {
            in.close();
            console.close();
            serverSocket.close();
        }
        catch (IOException e) {
            e.printStackTrace(); // Exception handling                                                                                                                                                      
        }
    }
}
