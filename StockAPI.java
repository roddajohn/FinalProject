import java.io.*;
import java.net.*;
import org.apache.commons.io.FileUtils;

public class StockAPI {
    public static final String BASEQUOTEURL = "http://download.finance.yahoo.com/d/quotes.csv?s=";
    public static final String NAMEPROPERTY = "n";
    public static final String SYMBOLPROPERTY = "s";
    public static final String LATESTVALUEPROPERTY = "l1";
    public static final String OPENLASTTRADINGDAYPROPERTY = "o";
    public static final String CLOSELASTTRADINGDAYPROPERTY = "p";
    public static final String USEPROPERTIES = "&f";
    public static final String ENDOFURLQUOTE = "&e=.csv";

    public static void main(String[] args) {
	FileUtils.copyURLToFile(new URL(BASEQUOTEURL + "GOOG" + USEPROPERTIES + NAMEPROPERTY + SYMBOLPROPERTY + ENDOFURLQUOTE), new File("currentInfo.csv"));
    }

    public Stock getStock(String symbol) {
	return null;	
    }
}