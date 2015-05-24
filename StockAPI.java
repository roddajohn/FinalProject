import java.io.*;
import java.net.*;
import java.nio.channels.*;
import java.util.*;

public class StockAPI {
    public static final String BASEQUOTEURL = "http://download.finance.yahoo.com/d/quotes.csv?s=";
    public static final String NAMEPROPERTY = "n";
    public static final String SYMBOLPROPERTY = "s";
    public static final String LATESTVALUEPROPERTY = "l1";
    public static final String OPENLASTTRADINGDAYPROPERTY = "o";
    public static final String CLOSELASTTRADINGDAYPROPERTY = "p";
    public static final String USEPROPERTIES = "&f=";
    public static final String ENDOFURLQUOTE = "&e=.csv";

    private static final int BUFFER_SIZE = 4096;

    private static ArrayList<String> stocks = new ArrayList<String>();
 
    public static void main(String[] args) {
	try {
	    downloadFile(BASEQUOTEURL + "GOOG" + USEPROPERTIES + SYMBOLPROPERTY + NAMEPROPERTY + LATESTVALUEPROPERTY + ENDOFURLQUOTE, "output.csv");
	}
	catch (IOException e) {
	    e.printStackTrace();
	}
    }

    public static Stock getStock(String symbol) {
	return null;	
    }

    public static void addStockToFollow(String symbol) {
	stocks.add(symbol);
    }

    public static void removeStockToFollow(String symbol) {
	stocks.remove(stocks.indexOf(symbol));
    }

    
    /**
     * Downloads a file from a URL
     * @param fileURL HTTP URL of the file to be downloaded
     * @param saveDir path of the directory to save the file
     * @throws IOException
     *
     *  CODE NOT ORIGINAL -- CODE FROM http://www.codejava.net/java-se/networking/use-httpurlconnection-to-download-file-from-an-http-url
     */
    public static void downloadFile(String fileURL, String saveDir)
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

    private StockUpdateThread extends Thread {
	private ArrayList<String> stocks;
	private StockUpdateThread(ArrayList<String> s) {
	    stocks = s;
	}
	
	private void run() {}
	    
	}
    }
}