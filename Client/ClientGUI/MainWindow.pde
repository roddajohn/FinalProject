import controlP5.*;
import javax.swing.*;

public class MainWindow extends JFrame {
  private final int w = 600;
  private final int h = 400;  

  private Client client; 
  private ControlP5 c;
  private PApplet main;

  // STILL HAVE TO DEAL WITH CLOSING ISSUES, ie, ALL WINDOWS CLOSED BUT IT IS STILL RUNNING
  public void quit() {
    dispose();
  }

  // STILL HAVE TO DEAL WITH CLOSING ISSUES, ie, ALL WINDOWS CLOSED BUT IT IS STILL RUNNING

  // Add an administrator command that pushes the player, and StockAPI information to a file for easier viewing...

  // Fix issues that occur when you search for a stock that doesn't exist...

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

    private ArrayList<String> portfolio;
    private ArrayList<Integer> amts;

    private ArrayList<String> history;

    private Textfield search, amount, sellAmount, search2;

    private Textlabel name, symbol, current, open, close, volume, dividends, moneyLabel;

    private ChartAPI charts;

    private Toggle chart1, chart2, chart3;

    private int tabState, chartState;

    public boolean chartsReady;
    
    private String Emotion1, Emotion2, Emotion3, Emotion4, Emotion5, Emotion6, Emotion7, Emotion8, Emotion9, Emotion10;

    private ChartThread t;

    private double money;

    ListBox l, h;

    String stock;

    public void setup() {

      background(255); 
      c = new ControlP5(this);

    
      
     
      
      history = new ArrayList<String>();
      money = 0.0;
      chartsReady = false;
      charts = new ChartAPI();
      tabState = 0;
      chartState = 0;
      stocks = new ArrayList<Stock>();
      portfolio = new ArrayList<String>();
      amts = new ArrayList<Integer>();
      stock = "";

      background(255);
      c = new ControlP5(this);

     
      c.getTab("default").setLabel("Search").setWidth(600 / 5).setHeight(40).setId(1).activateEvent(true);
      c.addTab("tab2").setLabel("Portfolio").setWidth(600 / 5).setHeight(40).setId(2).activateEvent(true);
      c.addTab("tab3").setLabel("Metrics Algorithm").setWidth(600 / 5).setHeight(40).setId(3).activateEvent(true);
      c.addTab("tab4").setLabel("History -- Temporary").setWidth(600 / 5).setHeight(40).setId(11).activateEvent(true);
     c.addTab("tab5").setLabel("Twitter Algorithm").setWidth(600 / 5).setHeight(40).setId(13).activateEvent(true);

   c.addSlider("BcurrentValue").setPosition(25,100).setSize(100,20).setRange(0,255).moveTo("tab3").setId(20);
     c.addSlider("BcloseLastDay").setPosition(25,150).setSize(100,20).setRange(0,255).moveTo("tab3").setId(21);
     c.addSlider("openLastDay").setPosition(25,200).setSize(100,20).setRange(0,255).moveTo("tab3").setId(22);
     c.addSlider("BID").setPosition(25,250).setSize(100,20).setRange(0,255).moveTo("tab3").setId(23);
     c.addSlider("TargetEstimate").setPosition(25,300).setSize(100,20).setRange(0,255).moveTo("tab3").setId(24);
     
     c.addSlider("Beta").setPosition(175,100).setSize(100,20).setRange(0,255).moveTo("tab3").setId(25);
     c.addSlider("DaysRange").setPosition(175,150).setSize(100,20).setRange(0,255).moveTo("tab3").setId(26);
     c.addSlider("Week52Volume").setPosition(175,200).setSize(100,20).setRange(0,255).moveTo("tab3").setId(27);
     c.addSlider("Volume").setPosition(175,250).setSize(100,20).setRange(0,255).moveTo("tab3").setId(28);
     c.addSlider("AvgVolume").setPosition(175,300).setSize(100,20).setRange(0,255).moveTo("tab3").setId(29);
     
      c.addSlider("WcurrentValue").setPosition(325,100).setSize(100,20).setRange(0,255).moveTo("tab3").setId(39);
     c.addSlider("WcloseLastDay").setPosition(325,150).setSize(100,20).setRange(0,255).moveTo("tab3").setId(40);
     c.addSlider("WopenLastDay").setPosition(325,200).setSize(100,20).setRange(0,255).moveTo("tab3").setId(41);
     c.addSlider("WBID").setPosition(325,250).setSize(100,20).setRange(0,255).moveTo("tab3").setId(42);
     c.addSlider("WTargetEstimate").setPosition(325,300).setSize(100,20).setRange(0,255).moveTo("tab3").setId(43);
     
     c.addSlider("WBeta").setPosition(475,100).setSize(100,20).setRange(0,255).moveTo("tab3").setId(44);
     c.addSlider("WDaysRange").setPosition(475,150).setSize(100,20).setRange(0,255).moveTo("tab3").setId(45);
     c.addSlider("WWeek52Volume").setPosition(475,200).setSize(100,20).setRange(0,255).moveTo("tab3").setId(46);
     c.addSlider("WVolume").setPosition(475,250).setSize(100,20).setRange(0,255).moveTo("tab3").setId(47);
     c.addSlider("WAvgVolume").setPosition(475,300).setSize(100,20).setRange(0,255).moveTo("tab3").setId(48);
     
     
      c.addSlider("Emotion 1").setPosition(25,100).setSize(100, 20).setRange(0,255).moveTo("tab5").setId(14);
      c.addSlider("Emotion 2").setPosition(25,150).setSize(100,20).setRange(0,255).moveTo("tab5").setId(15);
      c.addSlider("Emotion 3").setPosition(25,200).setSize(100,20).setRange(0,255).moveTo("tab5").setId(16);
      c.addSlider("Emotion 4").setPosition(25, 250).setSize(100,20).setRange(0,255).moveTo("tab5").setId(17);
      c.addSlider("Emotion 5").setPosition(25, 300).setSize(100,20).setRange(0,255).moveTo("tab5").setId(18);
      
      c.addSlider("Emotion 6").setPosition(175,100).setSize(100,20).setRange(0,255).moveTo("tab5").setId(59);
      c.addSlider("Emotion 7").setPosition(175,150).setSize(100,20).setRange(0,255).moveTo("tab5").setId(60);
      c.addSlider("Emotion 8").setPosition(175,200).setSize(100,20).setRange(0,255).moveTo("tab5").setId(61);
      c.addSlider("Emotion 9").setPosition(175,250).setSize(100,20).setRange(0,255).moveTo("tab5").setId(62);
      c.addSlider("Emotion 10").setPosition(175,300).setSize(100,20).setRange(0,255).moveTo("tab5").setId(63);
      
      c.addSlider("Wieght Emotion 1").setPosition(325,100).setSize(100, 20).setRange(0,255).moveTo("tab5").setId(74);
      c.addSlider("Wieght Emotion 2").setPosition(325,150).setSize(100,20).setRange(0,255).moveTo("tab5").setId(75);
      c.addSlider("Wieght Emotion 3").setPosition(325,200).setSize(100,20).setRange(0,255).moveTo("tab5").setId(76);
      c.addSlider("Wieght Emotion 4").setPosition(325, 250).setSize(100,20).setRange(0,255).moveTo("tab5").setId(77);
      c.addSlider("Wieght Emotion 5").setPosition(325, 300).setSize(100,20).setRange(0,255).moveTo("tab5").setId(78);
      
      
      c.addSlider("Wieght Emotion 6").setPosition(475,100).setSize(100, 20).setRange(0,255).moveTo("tab5").setId(79);
      c.addSlider("Wieght Emotion 7").setPosition(475,150).setSize(100,20).setRange(0,255).moveTo("tab5").setId(80);
      c.addSlider("Wieght Emotion 8").setPosition(475,200).setSize(100,20).setRange(0,255).moveTo("tab5").setId(81);
      c.addSlider("Wieght Emotion 9").setPosition(475, 250).setSize(100,20).setRange(0,255).moveTo("tab5").setId(82);
      c.addSlider("Wieght Emotion 10").setPosition(475, 300).setSize(100,20).setRange(0,255).moveTo("tab5").setId(83);
      
      
      c.addButton("ResetButton1").setId(64).setPosition(25, 55).setSize(50, 20).moveTo("tab3").setLabel("Reset");
      c.addButton("ResetButton2").setId(65).setPosition(25, 55).setSize(50, 20).moveTo("tab5").setLabel("Reset");
      
      c.addButton("ST1").setId(66).setPosition(410, 335).setSize(75, 20).moveTo("tab3").setLabel("Start Algorithm");
      c.addButton("ST2").setId(67).setPosition(410, 335).setSize(75, 20).moveTo("tab5").setLabel("Start Algorithm");
      
      
      c.addButton("STOP1").setId(68).setPosition(500, 335).setSize(75, 20).moveTo("tab3").setLabel("Stop Algorithm");
      c.addButton("STOP2").setId(69).setPosition(500, 335).setSize(75, 20).moveTo("tab5").setLabel("Stop Algorithm");
      
         Emotion1 = "Default Emotion 1";
          Emotion2 = "Default Emotion 2";
          Emotion3 = "Default Emotion 3";
          Emotion4 = "Default Emotion 4";
          Emotion5 = "Default Emotion 5";
          Emotion6 = "Default Emotion 6";
          Emotion7 = "Default Emotion 7";
          Emotion8 = "Default Emotion 8";
          Emotion9 = "Default Emotion 9";
          Emotion10 = "Default Emotion 10";
          
      
      c.addTextlabel("E1").setText(Emotion1).setLabel("").setPosition(25, 90).setColor(0).moveTo("tab5");
      c.addTextlabel("E2").setText(Emotion2).setLabel("").setPosition(25, 140).setColor(0).moveTo("tab5");
      c.addTextlabel("E3").setText(Emotion3).setLabel("").setPosition(25, 190).setColor(0).moveTo("tab5");
      c.addTextlabel("E4").setText(Emotion4).setLabel("").setPosition(25, 240).setColor(0).moveTo("tab5");
      c.addTextlabel("E5").setText(Emotion5).setLabel("").setPosition(25, 290).setColor(0).moveTo("tab5");
      c.addTextlabel("E6").setText(Emotion6).setLabel("").setPosition(175, 90).setColor(0).moveTo("tab5");
      c.addTextlabel("E7").setText(Emotion7).setLabel("").setPosition(175, 140).setColor(0).moveTo("tab5");
      c.addTextlabel("E8").setText(Emotion8).setLabel("").setPosition(175, 190).setColor(0).moveTo("tab5");
      c.addTextlabel("E9").setText(Emotion9).setLabel("").setPosition(175, 240).setColor(0).moveTo("tab5");
      c.addTextlabel("E10").setText(Emotion10).setLabel("").setPosition(175, 290).setColor(0).moveTo("tab5");
      
      
      c.addTextlabel("WE1").setText("Wieght of" + Emotion1).setLabel("").setPosition(325, 90).setColor(0).moveTo("tab5");
      c.addTextlabel("WE2").setText("Wieght of" + Emotion2).setLabel("").setPosition(325, 140).setColor(0).moveTo("tab5");
      c.addTextlabel("WE3").setText("Wieght of" + Emotion3).setLabel("").setPosition(325, 190).setColor(0).moveTo("tab5");
      c.addTextlabel("WE4").setText("Wieght of" + Emotion4).setLabel("").setPosition(325, 240).setColor(0).moveTo("tab5");
      c.addTextlabel("WE5").setText("Wieght of" + Emotion5).setLabel("").setPosition(325, 290).setColor(0).moveTo("tab5");
      c.addTextlabel("WE6").setText("Wieght of" + Emotion6).setLabel("").setPosition(475, 90).setColor(0).moveTo("tab5");
      c.addTextlabel("WE7").setText("Wieght of" + Emotion7).setLabel("").setPosition(475, 140).setColor(0).moveTo("tab5");
      c.addTextlabel("WE8").setText("Wieght of" + Emotion8).setLabel("").setPosition(475, 190).setColor(0).moveTo("tab5");
      c.addTextlabel("WE9").setText("Wieght of" + Emotion9).setLabel("").setPosition(475, 240).setColor(0).moveTo("tab5");
      c.addTextlabel("WE10").setText("Wieght of" + Emotion10).setLabel("").setPosition(470, 290).setColor(0).moveTo("tab5");
      
      
      
      c.addTextlabel("M1").setText("Current Value").setLabel("").setPosition(25, 90).setColor(0).moveTo("tab3");
      c.addTextlabel("M2").setText("Close Last Day").setLabel("").setPosition(25, 140).setColor(0).moveTo("tab3");
      c.addTextlabel("M3").setText("Open Last Day").setLabel("").setPosition(25, 190).setColor(0).moveTo("tab3");
      c.addTextlabel("M4").setText("BID").setLabel("").setPosition(25, 240).setColor(0).moveTo("tab3");
      c.addTextlabel("M5").setText("Target Estimate").setLabel("").setPosition(25, 290).setColor(0).moveTo("tab3");
      c.addTextlabel("M6").setText("Beta").setLabel("").setPosition(175, 90).setColor(0).moveTo("tab3");
      c.addTextlabel("M7").setText("Days Range").setLabel("").setPosition(175, 140).setColor(0).moveTo("tab3");
      c.addTextlabel("M8").setText("Week 52 Volume").setLabel("").setPosition(175, 190).setColor(0).moveTo("tab3");
      c.addTextlabel("M9").setText("Volume").setLabel("").setPosition(175, 240).setColor(0).moveTo("tab3");
      c.addTextlabel("M10").setText("Average Volume").setLabel("").setPosition(175, 290).setColor(0).moveTo("tab3");
      
      
      c.addTextlabel("MWE1").setText("Wieght of CV").setLabel("").setPosition(325, 90).setColor(0).moveTo("tab3");
      c.addTextlabel("MWE2").setText("Wieght of CLD").setLabel("").setPosition(325, 140).setColor(0).moveTo("tab3");
      c.addTextlabel("MWE3").setText("Wieght of OLD").setLabel("").setPosition(325, 190).setColor(0).moveTo("tab3");
      c.addTextlabel("MWE4").setText("Wieght of BID").setLabel("").setPosition(325, 240).setColor(0).moveTo("tab3");
      c.addTextlabel("MWE5").setText("Wieght of TE").setLabel("").setPosition(325, 290).setColor(0).moveTo("tab3");
      c.addTextlabel("MWE6").setText("Wieght of Beta").setLabel("").setPosition(475, 90).setColor(0).moveTo("tab3");
      c.addTextlabel("MWE7").setText("Wieght of DR" ).setLabel("").setPosition(475, 140).setColor(0).moveTo("tab3");
      c.addTextlabel("MWE8").setText("Wieght of 52WV" ).setLabel("").setPosition(475, 190).setColor(0).moveTo("tab3");
      c.addTextlabel("MWE9").setText("Wieght of Volume" ).setLabel("").setPosition(475, 240).setColor(0).moveTo("tab3");
      c.addTextlabel("MWE10").setText("Wieght of AV").setLabel("").setPosition(470, 290).setColor(0).moveTo("tab3");
      
       c.addTextlabel("search2").setText("Search: ").setLabel("").setPosition(85, 60).setColor(0).moveTo("tab3");
     search2 = c.addTextfield("searchField2").setLabel("").setPosition(135, 55).setWidth(100).moveTo("tab3").setFocus(true);
     c.addButton("searchButton2").setLabel("Search").setPosition(260, 55).setSize(50, 20).setId(70).moveTo("tab3");
      
      c.addTextlabel("search3").setText("Search: ").setLabel("").setPosition(85, 60).setColor(0).moveTo("tab5");
     search2 = c.addTextfield("searchField3").setLabel("").setPosition(135, 55).setWidth(100).moveTo("tab5").setFocus(true);
     c.addButton("searchButton3").setLabel("Search").setPosition(260, 55).setSize(50, 20).setId(71).moveTo("tab5");
     
     
       c.addTextlabel("SPM1").setText("Shares Per Minute: ").setLabel("").setPosition(45, 340).setColor(0).moveTo("tab3");
     search2 = c.addTextfield("SPMT1").setLabel("").setPosition(135, 335).setWidth(100).moveTo("tab3").setFocus(true);
     c.addButton("SPMB1").setLabel("Set SPM").setPosition(260, 335).setSize(50, 20).setId(72).moveTo("tab3");
      
      c.addTextlabel("SharesPerMinute").setText("Shares per Minute: ").setLabel("").setPosition(45, 340).setColor(0).moveTo("tab5");
     search2 = c.addTextfield("SPM2").setLabel("").setPosition(135, 335).setWidth(100).moveTo("tab5").setFocus(true);
     c.addButton("SPMB2").setLabel("Set SPM").setPosition(260, 335).setSize(50, 20).setId(73).moveTo("tab5");
   
      
      // Setup of the PORTFOLIO tab

      moneyLabel = c.addTextlabel("Money: ").setPosition(10, 50).moveTo("tab2").setColor(0);
      l = c.addListBox("Portfolio").setPosition(10, 80).moveTo("tab2").setHeight(280).setWidth(100).setItemHeight(15).setBarHeight(10).setId(10).actAsPulldownMenu(false).activateEvent(true).disableCollapse(); // 100 x 20
      c.addTextlabel("sellLabel").setText("Sell: ").setPosition(130, 340).moveTo("tab2").setColor(0);
      sellAmount = c.addTextfield("sellAmount").setPosition(160, 335).setWidth(100).setHeight(20).moveTo("tab2");
      c.addButton("sellButton").setId(12).setPosition(280, 335).setSize(50, 20).moveTo("tab2").setLabel("Sell");

      // HISTORY TAB SETUP

      h = c.addListBox("History -- The Newest Transactions are at the Bottom").setPosition(10, 60).moveTo("tab4").setHeight(300).setWidth(565).setItemHeight(15).setBarHeight(10);

      // Setup of the SEARCH tab

      c.addTextlabel("search").setText("Search: ").setLabel("").setPosition(15, 55).setColor(0).moveTo("default");
      search = c.addTextfield("searchField").setLabel("").setPosition(65, 50).moveTo("default").setWidth(100).moveTo("default").setFocus(true);
      c.addButton("searchButton").setLabel("Search").setPosition(180, 50).setSize(50, 20).setId(4).moveTo("default");
      c.addButton("refreshButton").setLabel("Refresh").setPosition(250, 50).setSize(50, 20).setId(5).moveTo("default");
      c.addTextlabel("buyLabel").setText("Buy: ").setPosition(315, 55).moveTo("default").setColor(0);
      amount = c.addTextfield("amountEnteringField").setLabel("").setPosition(350, 50).moveTo("default").setWidth(150).setFocus(false);
      c.addButton("buyButton").setLabel("Buy").setPosition(525, 50).setId(9).moveTo("default").setSize(50, 20);
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
              if (s.getName().length() > 25) {
                name.setText(s.getName().substring(0, 25));
              }
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
            img = null;
          } else {
            fill(0);
            textSize(48);
            text("Loading...", 300, 200);
          }
        }
      } else if (tabState == 1) {
        if (chartsReady) {
          PImage img = loadImage(charts.getChartAddress(1, stock));
          image(img, 130, 50, 460, 275);
          img = null;
        } else if (!stock.equals("")) {
          fill(0);
          textSize(48);
          text("Loading...", 300, 200);
        }

        line(120, 40, 120, 400);
        line(120, 320, 600, 320);

        moneyLabel.setText("Money: " + (int)money);
      } else if (tabState == 2) {
        
        
        
        
        
      } else if (tabState == 3) {
        h.clear();
        for (int i = 0; i < history.size (); i++) {
          h.addItem(history.get(i), i);
        }
      } else if (tabState == 4){
        
        boolean StockSearched = false;
        
        if (!StockSearched){
          Emotion1 = "Emotion 1";
          Emotion2 = "Emotion 2";
          Emotion3 = "Emotion 3";
          Emotion4 = "Emotion 4";
          Emotion5 = "Emotion 5";
          Emotion6 = "Emotion 6";
          Emotion7 = "Emotion 7";
          Emotion8 = "Emotion 8";
          Emotion9 = "Emotion 9";
          Emotion10 = "Emotion 10";
          
          
          
          
        } else {
          //Get and Set Methods for the hashtags
          
          
        }
        
      }
      
    }

    public void updateMoney() {
      money = Double.parseDouble(client.recieveInformation("money"));
    }

    public void updatePortfolio() {
      portfolio.clear();
      amts.clear();
      String information = client.recieveInformation("portfolio");
      println("Recieved this information: " + information);
      if (!information.equals("")) {
        println("inside");
        String[] parsed = information.split(";");
        for (int i = 0; i < parsed.length; i++) {
          String[] a = parsed[i].split(",");
          println("have: " + a[0]);
          portfolio.add(a[0]);
          amts.add(Integer.parseInt(a[1]));
        }
      }
      l.clear();
      for (int i = 0; i < portfolio.size (); i++) {
        l.addItem(portfolio.get(i) + " " + amts.get(i), i);
      }
      l.updateListBoxItems();
      l.updateEvents();
      l.update();
      println("Got through update portfolio");
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
      } else if (tabState == 2) {
        if (keyCode == 10) {
          if (!stock.equals("") && !sellAmount.getText().equals("")) {
            try {
              int shares = Integer.parseInt(sellAmount.getText());
              if (client.sendMessage("sell " + stock + " " + shares)) {
                double d = 0.0;
                updateStock(stock);
                for (Stock s : stocks) {
                  if (s.getSymbol().equals(stock)) {
                    d = s.getCurrentValue();
                  }
                }
                message("Success -- you just sold " + shares + " shares of " + stock + " at " + d + " a share!");
                history.add("Sold " + shares + " shares of " + stock);
              } else {
                errorMessage("You don't have that many shares");
              }
            }
            catch (NumberFormatException a) {
              errorMessage("Please enter a number into the amount field");
            }
          } else {
            errorMessage("Ensure that you have entered an amount and that you have selected the stock you wish to sell.");
          }
          amount.setText("");
          updatePortfolio();
          updateMoney();
        }
      }
    }

    public void controlEvent(ControlEvent e) {
      switch(e.getId()) {
      case 1:
        stock = "";
        chartsReady = false;
        tabState = 0;
        break;

      case 2:
        tabState = 1;
        updatePortfolio();
        updateMoney();
        chartsReady = false;
        stock = "";
        break;

      case 3:
        tabState = 2;
        break;

      case 11:
        tabState = 3;
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

      case 9:
        if (!stock.equals("") && !amount.getText().equals("")) {
          try {
            int shares = Integer.parseInt(amount.getText());
            if (client.sendMessage("buy " + stock + " " + shares)) {
              double d = 0.0;
              updateStock(stock);
              for (Stock s : stocks) {
                if (s.getSymbol().equals(stock)) {
                  d = s.getCurrentValue();
                }
              }
              message("Success -- you just bought " + shares + " shares of " + stock + " at " + d + " a share!");
              history.add("Bought " + shares + " shares of " + stock);
            } else {
              errorMessage("You don't have enough money, the purchase did not go through");
            }
          }
          catch (NumberFormatException a) {
            errorMessage("Please enter a number into the amount field");
          }
        } else {
          errorMessage("Please enter something into both text fields, and make sure that you have already searched the stock.");
        }
        sellAmount.setText("");
        break;

      case 10:
        stock = portfolio.get((int)e.group().value());
        chartsReady = false;
        t = new ChartThread(charts, stock);
        t.start();
        break;

      case 12:
        if (!stock.equals("") && !sellAmount.getText().equals("")) {
          try {
            int shares = Integer.parseInt(sellAmount.getText());
            if (client.sendMessage("sell " + stock + " " + shares)) {
              double d = 0.0;
              updateStock(stock);
              for (Stock s : stocks) {
                if (s.getSymbol().equals(stock)) {
                  d = s.getCurrentValue();
                }
              }
              message("Success -- you just sold " + shares + " shares of " + stock + " at " + d + " a share!");
              history.add("Sold " + shares + " shares of " + stock);
            } else {
              errorMessage("You don't have that many shares");
            }
          }
          catch (NumberFormatException a) {
            errorMessage("Please enter a number into the amount field");
          }
        } else {
          errorMessage("Ensure that you have entered an amount and that you have selected the stock you wish to sell.");
        }
        amount.setText("");
        updatePortfolio();
        updateMoney();
        break;
     case 13:
     tabState = 4;
     
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

    public void message(String e) {
      JOptionPane.showMessageDialog(new JFrame(), e);
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

