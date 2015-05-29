import java.net.*;
import java.io.*;
import java.util.*;

public class Client {
    private final String serverAddress = "127.0.0.1";
    private final int port = 23456;

    public Client() {
	
    }

    public runClient() {
	Socket socket = null;
	BufferedReader in = null;
	PrintWriter out = null;
	try {
	    socket = new Socket(serverAddress, port);
	    out = new PrintWriter(socket.getOutputStream());
	    in = new BufferedReader(new InputStreamReader(socket.getInputStream()));
	}
	catch (UnknownHostException e) {
	    e.printStackTrace();
	}
	catch (IOException e) {
	    e.printStackTrace();
	}

	Scanner console = new Scanner(System.in);
	
	String input = "";

	System.out.print("Command: ");
	while ((input = console.nextLine()) != null) {
	    if (input.equals("logout")) {
		out.println(input);
		break;
	    }
	    else {
		out.println(input);
	    }
	    try {
		System.out.print("Server: " + in.readLine());
	    }
	    catch (IOException e) {
		e.printStackTrace();
	    }
	}

	try {
	    out.close();
	    in.close();
	    console.close();
	    socket.close();
	}
	catch (IOException e) {
	    e.printStackTrace();
	}
    }
}