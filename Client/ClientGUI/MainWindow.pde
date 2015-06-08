import controlP5.*;
import javax.swing.*;
import java.util.*;

public class MainWindow extends JFrame {
  private Client client;
  private PApplet main;

  public void quit() {
    dispose();
  }

  // STILL HAVE TO DEAL WITH CLOSING ISSUES, ie, ALL WINDOWS CLOSED BUT IT IS STILL RUNNING

  // Add an administrator command that pushes the player, and StockAPI information to a file for easier viewing...

  // Fix issues that occur when you search for a stock that doesn't exist...

  private ControlP5 c;

  public MainWindow(Client c, PApplet m) {
    main = m;
    client = c;
    setBounds(100, 75, 600, 400);
    this.setResizable(false);
    PApplet p = new secondApplet();
    add(p);
    p.init();
    show();
  }

  private class secondApplet extends PApplet {
    private ArrayList<Stock> stocks;

    private Textfield search;

    private Textlabel name, symbol, current, open, close, volume, dividends;

    private ChartAPI charts;

    private Toggle chart1, chart2, chart3;

    private int tabState, chartState;

    public boolean chartsReady;

    private ChartThread t;

    String stock;

    public void setup() {
      chartsReady = false;
      charts = new ChartAPI();
      tabState = 0;
      chartState = 0;
      stocks = new ArrayList<Stock>();
      stock = "";

      background(255);
      c = new ControlP5(this);

      c.getTab("default").setLabel("Search").setWidth(600 / 3).setHeight(40).setId(1).activateEvent(true);
      c.addTab("tab2").setLabel("Portfolio").setWidth(600 / 3).setHeight(40).setId(2).activateEvent(true);
      c.addTab("tab3").setLabel("Algorithm").setWidth(600 / 3).setHeight(40).setId(3).activateEvent(true);
      c.addTab("tab5").setLabel("Sentiment Analyzer").setWidth(600 / 3).setHeight(40).setId(4).activateEvent(true);
      
      // Set up the sliders for the sentiment analyzer
      
      c.addSlider("Emotion 1").setPosition(200,140).setSize(20,100).setRange(0,255).setNumberOfTickMarks(5);
      c.addSlider("Emotion 2").setPosition(200,200).setSize(20,100).setRange(0,255).setNumberOfTickMarks(5);
      c.addSlider("Emotion 3").setPosition(200,250).setSize(20,100).setRange(0,255).setNumberOfTickMarks(5);
      c.addSlider("Emotion 4").setPosition(200,300).setSize(20,100).setRange(0,255).setNumberOfTickMarks(5);
      c.addSlider("Emotion 6").setPosition(200,350).setSize(20,100).setRange(0,255).setNumberOfTickMarks(5);
      c.addSlider("Emotion 7").setPosition(200,400).setSize(20,100).setRange(0,255).setNumberOfTickMarks(5);
      
      
      
      //Set up the sliders
      
     c.addSlider("currentValue").setPosition(100,140).setSize(20,100).setRange(0,255).setNumberOfTickMarks(5);
     c.addSlider("closeLastDay").setPosition(100,170).setSize(20,100).setRange(0,255).setNumberOfTickMarks(5);
     c.addSlider("openLastDay").setPosition(100,200).setSize(20,100).setRange(0,255).setNumberOfTickMarks(5);
     c.addSlider("BID").setPosition(100,230).setSize(20,100).setRange(0,255).setNumberOfTickMarks(5);
     c.addSlider("TargetEstimate").setPosition(100,260).setSize(20,100).setRange(0,255).setNumberOfTickMarks(5);
     c.addSlider("Beta").setPosition(100,290).setSize(20,100).setRange(0,255).setNumberOfTickMarks(5);
     c.addSlider("DaysRange").setPosition(100,320).setSize(20,100).setRange(0,255).setNumberOfTickMarks(5);
     c.addSlider("Week52Volume").setPosition(100,350).setSize(20,100).setRange(0,255).setNumberOfTickMarks(5);
     c.addSlider("Volume").setPosition(100,380).setSize(20,100).setRange(0,255).setNumberOfTickMarks(5);
     c.addSlider("AvgVolume").setPosition(100,410).setSize(20,100).setRange(0,255).setNumberOfTickMarks(5);
      c.addSlider("MarketCapitalization").setPosition(100,440).setSize(20,100).setRange(0,255).setNumberOfTickMarks(5);
      c.addSlider("EPS").setPosition(100,470).setSize(20,100).setRange(0,255).setNumberOfTickMarks(5);
      c.addSlider("DividendsandYield").setPosition(100,140).setSize(20,100).setRange(0,255).setNumberOfTickMarks(5);
      c.addSlider("P2SR").setPosition(100,500).setSize(20,100).setRange(0,255).setNumberOfTickMarks(5);
      c.addSlider("FP2E").setPosition(100,600).setSize(20,100).setRange(0,255).setNumberOfTickMarks(5);
      c.addSlider("AEPS").setPosition(100,630).setSize(20,100).setRange(0,255).setNumberOfTickMarks(5);
      c.addSlider("QEPS").setPosition(100,660).setSize(20,100).setRange(0,255).setNumberOfTickMarks(5);
      c.addSlider("MeanReccomendations").setPosition(100,690).setSize(20,100).setRange(0,255).setNumberOfTickMarks(5);
      c.addSlider("PEGRatio").setPosition(100,720).setSize(20,100).setRange(0,255).setNumberOfTickMarks(5);
      c.addSlider("currentValue").setPosition(100,750).setSize(20,100).setRange(0,255).setNumberOfTickMarks(5);
      
      // Set up the slider ranges
      
      
          

      
      //set up the slider wieghts
      
      c.addSlider("WcurrentValue").setPosition(400,140).setSize(20,100).setRange(0,255).setNumberOfTickMarks(5);
     c.addSlider("WcloseLastDay").setPosition(400,170).setSize(20,100).setRange(0,255).setNumberOfTickMarks(5);
     c.addSlider("WopenLastDay").setPosition(400,200).setSize(20,100).setRange(0,255).setNumberOfTickMarks(5);
     c.addSlider("WBID").setPosition(400,230).setSize(20,100).setRange(0,255).setNumberOfTickMarks(5);
     c.addSlider("WTargetEstimate").setPosition(400,260).setSize(20,100).setRange(0,255).setNumberOfTickMarks(5);
     c.addSlider("WBeta").setPosition(400,290).setSize(20,100).setRange(0,255).setNumberOfTickMarks(5);
     c.addSlider("WDaysRange").setPosition(400,320).setSize(20,100).setRange(0,255).setNumberOfTickMarks(5);
     c.addSlider("WWeek52Volume").setPosition(400,350).setSize(20,100).setRange(0,255).setNumberOfTickMarks(5);
     c.addSlider("WVolume").setPosition(400,380).setSize(20,100).setRange(0,255).setNumberOfTickMarks(5);
     c.addSlider("WAvgVolume").setPosition(400,410).setSize(20,100).setRange(0,255).setNumberOfTickMarks(5);
      c.addSlider("WMarketCapitalization").setPosition(400,440).setSize(20,100).setRange(0,255).setNumberOfTickMarks(5);
      c.addSlider("WEPS").setPosition(400,470).setSize(20,100).setRange(0,255).setNumberOfTickMarks(5);
      c.addSlider("WDividendsandYield").setPosition(400,140).setSize(20,100).setRange(0,255).setNumberOfTickMarks(5);
      c.addSlider("WP2SR").setPosition(400,500).setSize(20,100).setRange(0,255).setNumberOfTickMarks(5);
      c.addSlider("WFP2E").setPosition(400,600).setSize(20,100).setRange(0,255).setNumberOfTickMarks(5);
      c.addSlider("WAEPS").setPosition(400,630).setSize(20,100).setRange(0,255).setNumberOfTickMarks(5);
      c.addSlider("WQEPS").setPosition(400,660).setSize(20,100).setRange(0,255).setNumberOfTickMarks(5);
      c.addSlider("WMeanReccomendations").setPosition(400,690).setSize(20,100).setRange(0,255).setNumberOfTickMarks(5);
      c.addSlider("WPEGRatio").setPosition(400,720).setSize(20,100).setRange(0,255).setNumberOfTickMarks(5);
      c.addSlider("WcurrentValue").setPosition(400,750).setSize(20,100).setRange(0,255).setNumberOfTickMarks(5);
      
      
      
      // Setup of the SEARCH tab
      
      

      c.addTextlabel("search").setText("Search: ").setLabel("").setPosition(15, 55).setColor(0).moveTo("default");
      search = c.addTextfield("searchField").setLabel("").setPosition(65, 50).moveTo("default").setWidth(100).moveTo("default").setFocus(true);
      c.addButton("searchButton").setLabel("Search").setPosition(180, 50).setSize(50, 20).setId(4).moveTo("default");
      c.addButton("refreshButton").setLabel("Refresh").setPosition(250, 50).setSize(50, 20).setId(5).moveTo("default");
      c.addTextlabel("name").setText("Name: ").setPosition(15, 95).moveTo("default").setColor(0);
      c.addTextlabel("symbol").setText("Symbol: ").setPosition(15, 120).moveTo("default").setColor(0);
      c.addTextlabel("currentValue").setText("Current Price: ").setPosition(15, 145).moveTo("default").setColor(0);
      c.addTextlabel("closeLastDay").setText("Close Last Day: ").setPosition(15, 170).moveTo("default").setColor(0);
      c.addTextlabel("open").setText("Open: ").setPosition(15, 195).moveTo("default").setColor(0);
      c.addTextlabel("volume").setText("Volume: ").setPosition(15, 220).moveTo("default").setColor(0);
      c.addTextlabel("dividendsandyield").setText("Dividends and Yield: ").setPosition(15, 245).moveTo("default").setColor(0);

      name = c.addTextlabel("nameT").setText("").setPosition(45, 95).moveTo("default").setColor(0);
      symbol = c.addTextlabel("symbolT").setText("").setPosition(55, 120).moveTo("default").setColor(0);
      current = c.addTextlabel("currentT").setText("").setPosition(75, 145).moveTo("default").setColor(0);
      close = c.addTextlabel("closeT").setText("").setPosition(85, 170).moveTo("default").setColor(0);
      open = c.addTextlabel("openT").setText("").setPosition(45, 195).moveTo("default").setColor(0);
      volume = c.addTextlabel("volumeT").setText("").setPosition(60, 220).moveTo("default").setColor(0);
      dividends = c.addTextlabel("dividendsT").setText("").setPosition(100, 245).moveTo("default").setColor(0);

      chart1 = c.addToggle("chart1").setPosition(181, 81).setWidth(139).setHeight(20).setId(6).moveTo("default");
      chart1.setBroadcast(false);
      chart1.setValue(true);
      chart1.setBroadcast(true);
      chart2 = c.addToggle("chart2").setPosition(320, 81).setWidth(139).setHeight(20).setId(7).moveTo("default");
      chart2.setBroadcast(false);
      chart2.setValue(false);
      chart2.setBroadcast(true);
      chart3 = c.addToggle("chart3").setPosition(459, 81).setWidth(140).setHeight(20).setId(8).moveTo("default");
      chart3.setBroadcast(false);
      chart3.setValue(false);
      chart3.setBroadcast(true);

      // Moving to correct tabs

      c.getController("search").moveTo("default");
      c.getController("searchField").moveTo("default");
      c.getController("searchButton").moveTo("default");
    }
    public void draw() {
      background(255);
      if (tabState == 0) {
        line(0, 80, 800, 80);
        line(180, 80, 180, 400);
        if (!stock.equals("")) {
          for (Stock s : stocks) {
            if (s.getSymbol().equals(stock)) {
              name.setText(s.getName());
              symbol.setText(s.getSymbol());
              current.setText("" + s.getCurrentValue());
              close.setText("" + s.getCloseLastDay());
              open.setText("" + s.getOpenLastDay());
              volume.setText("" + s.getVolume());
              dividends.setText("" + s.getDividendsandYield());
            }
          }
          if (chartsReady) {
            PImage img = loadImage(charts.getChartAddress(chartState + 1, stock));
            image(img, 190, 110, 400, 250);
          } else {
            fill(0);
            textSize(48);
            text("Loading...", 300, 200);
          }
        }
      }
    }

    public void updateStock(String st) {
      if (!stock.equals("")) {
        chartsReady = false;
        boolean found = false;
        for (Stock s : stocks) {
          if (s.getSymbol().equals(st)) {
            String input = client.recieveInformation("get " + st);
            if (input.equals("-1")) {
              errorMessage("We have experienced an error, please contact Rodda");
            } else {
              String[] parsed = input.split(",");
              s.setName(parsed[0]);
              s.setSymbol(parsed[1]);
              s.setCurrentValue(Double.parseDouble(parsed[2]));
              s.setCloseLastDay(Double.parseDouble(parsed[3]));
              s.setOpenLastDay(Double.parseDouble(parsed[4]));
              s.setVolume(Double.parseDouble(parsed[5]));
              s.setDividendsandYield(Double.parseDouble(parsed[6]));
              found = true;
            }
          }
        }
        if (!found) {
          String input = client.recieveInformation("get " + st);
          if (input.equals("-1")) {
            errorMessage("We have experienced an error, please contact Rodda");
          } else {
            String[] parsed = input.split(",");
            stocks.add(new Stock(parsed[0], parsed[1], Double.parseDouble(parsed[2]), Double.parseDouble(parsed[3]), Double.parseDouble(parsed[4]), Double.parseDouble(parsed[5]), Double.parseDouble(parsed[6])));
          }
        }
        ChartThread t = new ChartThread(charts, st);
        t.start();
      }
    }

    public void keyPressed() {
      if (tabState == 0) {
        if (keyCode == 10) {
          if (search.getText().equals("")) {
            errorMessage("You cannot leave the search field blank");
          } else {
            stock = search.getText();
            updateStock(stock);
          }
        } /*else if (keyCode == 82) {
         updateStock(stock);
         } */
        else if (keyCode == 9) {
          if (search.isFocus()) {
            search.setFocus(false);
          } else {
            search.setFocus(true);
          }
        }
      }
    }

    public void controlEvent(ControlEvent e) {
      switch(e.getId()) {
      case 1:
        tabState = 0;
        break;

      case 2:
        tabState = 1;
        break;

      case 3:
        tabState = 2;
        break;

      case 4:
        if (search.getText().equals("")) {
          errorMessage("You cannot leave the search field blank");
        } else {
          stock = search.getText();
          updateStock(stock);
        }
        break;

      case 5:
        updateStock(stock);
        break;

      case 6:
        if (chartState == 0) {
          chart1.setBroadcast(false);
          chart1.setValue(true);
          chart1.setBroadcast(true);
        } else {
          chart1.setBroadcast(false);
          chart2.setBroadcast(false);
          chart3.setBroadcast(false);
          chart1.setValue(true);
          chart2.setValue(false);
          chart3.setValue(false);
          chart1.setBroadcast(true);
          chart2.setBroadcast(true);
          chart3.setBroadcast(true);
          chartState = 0;
        }

        break;
      case 7:
        if (chartState == 1) {
          chart2.setBroadcast(false);
          chart2.setValue(true);
          chart2.setBroadcast(true);
        } else {
          chart1.setBroadcast(false);
          chart2.setBroadcast(false);
          chart3.setBroadcast(false);
          chart1.setValue(false);
          chart2.setValue(true);
          chart3.setValue(false);
          chart1.setBroadcast(true);
          chart2.setBroadcast(true);
          chart3.setBroadcast(true);
          chartState = 1;
        }

        break;
      case 8:
        if (chartState == 2) {
          chart3.setBroadcast(false);
          chart3.setValue(true);
          chart3.setBroadcast(true);
        } else {
          chart1.setBroadcast(false);
          chart2.setBroadcast(false);
          chart3.setBroadcast(false);
          chart1.setValue(false);
          chart2.setValue(false);
          chart3.setValue(true);
          chart1.setBroadcast(true);
          chart2.setBroadcast(true);
          chart3.setBroadcast(true);
          chartState = 2;
        }
        break;
      }
    }

    public void stop() {
      client.sendMessage("logout");
      main.exit();
      quit();
      exit();
    }


    public void errorMessage(String e) {
      JOptionPane.showMessageDialog(new JFrame(), e, "Error", JOptionPane.ERROR_MESSAGE);
    }

    private class ChartThread extends Thread {
      ChartAPI charts;
      String symbol;
      public ChartThread(ChartAPI c, String s) {
        symbol = s;
        charts = c;
      }

      public void run() {
        charts.loadCharts(symbol);
        chartsReady = true;
      }
    }
  }
}

