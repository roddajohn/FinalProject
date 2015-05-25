import java.io.*;
import java.net.*;
import java.nio.channels.*;
import java.util.*;

public class StockAPI {
    public final String BASEQUOTEURL = "http://download.finance.yahoo.com/d/quotes.csv?s=";
    public final String NAMEPROPERTY = "n";
    public final String SYMBOLPROPERTY = "s";
    public final String LATESTVALUEPROPERTY = "l1";
    public final String OPENLASTTRADINGDAYPROPERTY = "o";
    public final String CLOSELASTTRADINGDAYPROPERTY = "p";
    public final String USEPROPERTIES = "&f=";
    public final String ENDOFURLQUOTE = "&e=.csv";

    private final int BUFFER_SIZE = 4096;

    private ArrayList<String> stocks;
    private StockUpdateThread updateThread;

    public StockAPI() {
	stocks = new ArrayList<String>();
	updateThread = new StockUpdateThread(stocks);
	updateThread.start();
    }

    public Stock getStock(String symbol) {
	boolean toRemove = false;
	if (stocks.indexOf(symbol) == -1) {
	    stocks.add(symbol);
	    updateStocks();
	    toRemove = true;
	}
	String[] row = getRow(symbol);
	if (row == null) {
	    return null;
	}
	else {
	    Stock toReturn = new Stock(symbol);
	    toReturn.setCurrentValue(Double.parseDouble(row[2]));
	    toReturn.setName(row[0]);
	    if (toRemove) {
		stocks.remove(symbol);
	    }
	    return toReturn;
	}
    }

    public void addStockToFollow(String symbol) {
	stocks.add(symbol);
	updateStocks();
    }

    public void removeStockToFollow(String symbol) {
	stocks.remove(stocks.indexOf(symbol));
    }

    public String[] getRow(String symbol) {
	BufferedReader br = null;
	String line = "";
	try {
	    br = new BufferedReader(new FileReader("quotes.csv"));
	    while ((line = br.readLine()) != null) {
		String[] parsed = line.split(",");
		if (parsed[1].equals(symbol)) {
		    br.close();
		    return parsed;
		}
	    }
	}
	catch (FileNotFoundException e) {
	    e.printStackTrace();
	}
	catch (IOException e) {
	    e.printStackTrace();
	}
	try {
	    br.close();
	}
	catch (IOException e) {
	    e.printStackTrace();
	}
	return null;
    }
    
    /**
     * Downloads a file from a URL
     * @param fileURL HTTP URL of the file to be downloaded
     * @param saveDir path of the directory to save the file
     * @throws IOException
     *
     *  CODE NOT ORIGINAL -- CODE FROM http://www.codejava.net/java-se/networking/use-httpurlconnection-to-download-file-from-an-http-url
     */
    public void downloadFile(String fileURL, String saveDir)
	throws IOException {
        URL url = new URL(fileURL);
        HttpURLConnection httpConn = (HttpURLConnection) url.openConnection();
        int responseCode = httpConn.getResponseCode();
 
        // always check HTTP response code first
        if (responseCode == HttpURLConnection.HTTP_OK) {
            String fileName = "";
            String disposition = httpConn.getHeaderField("Content-Disposition");
            String contentType = httpConn.getContentType();
            int contentLength = httpConn.getContentLength();
 
            if (disposition != null) {
                // extracts file name from header field
                int index = disposition.indexOf("filename=");
                if (index > 0) {
                    fileName = disposition.substring(index + 10,
						     disposition.length() - 1);
                }
            } else {
                // extracts file name from URL
                fileName = fileURL.substring(fileURL.lastIndexOf("/") + 1,
					     fileURL.length());
            }
 
           // opens input stream from the HTTP connection
            InputStream inputStream = httpConn.getInputStream();
            String saveFilePath = saveDir;
            // opens an output stream to save into file
            FileOutputStream outputStream = new FileOutputStream(saveFilePath);
 
            int bytesRead = -1;
            byte[] buffer = new byte[BUFFER_SIZE];
            while ((bytesRead = inputStream.read(buffer)) != -1) {
                outputStream.write(buffer, 0, bytesRead);
            }
 
            outputStream.close();
            inputStream.close();

        } else {
	    System.out.println("Error");
        }
        httpConn.disconnect();
    }

    public void removeExtraneousQuotationMarks() {
	BufferedReader br = null;
	String line = "";
	String toWrite = "";
	try {
	    br = new BufferedReader(new FileReader("quotes.csv"));
	    while ((line = br.readLine()) != null) {
	        toWrite += line + "\n";
	    }	
	}
	catch (IOException e) {
	    e.printStackTrace();
	}
	toWrite = toWrite.replace("\"", "");
	try {
	    PrintWriter writer = new PrintWriter("quotes.csv");
	    writer.print(toWrite);
	    writer.close();
	}
	catch (FileNotFoundException e) {
	    e.printStackTrace();
	}
    }

    public void updateStocks() {
	String url = "";
	if (stocks.size() != 0) {
	    url += BASEQUOTEURL;
	    for (int i = 0; i < stocks.size(); i++) {
		url += stocks.get(i) + ",";
	    }
	    url = url.substring(0, url.length() - 1);
	    url += USEPROPERTIES + NAMEPROPERTY + SYMBOLPROPERTY + LATESTVALUEPROPERTY + ENDOFURLQUOTE;
	    try {
		downloadFile(url, "quotes.csv");
	    }
	    catch (IOException e) {
		e.printStackTrace();
	    }
	    removeExtraneousQuotationMarks();
	} 
    }
    
    private class StockUpdateThread extends Thread {
	private ArrayList<String> stocks;
	public StockUpdateThread(ArrayList<String> s) {
	    stocks = s;
	}
	
	public void run() {
	    while (1 == 1) {
		updateStocks();
		try {
		    sleep(10000);
		}
		catch (InterruptedException e) {
		    
		}
	    }
	}    
    }
}