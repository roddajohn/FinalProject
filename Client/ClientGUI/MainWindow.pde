import controlP5.*;
import javax.swing.*;

public class MainFrame extends JFrame {
  private Client client;

 
 // STILL HAVE TO DEAL WITH CLOSING ISSUES, ie, ALL WINDOWS CLOSED BUT IT IS STILL RUNNING
 
  private ControlP5 c;
  
  public MainFrame(Client c) {
    client = c;
    setBounds(100, 75,600, 400);
    this.setResizable(false);
    PApplet p = new secondApplet();
    add(p);
    p.init();
    show();  
  }
  
  private class secondApplet extends PApplet {
    private Textfield search;
    
    private int tabState;
    
    public void setup() {
      tabState = 0;
      background(255);
      c = new ControlP5(this);
      
      c.getTab("default").setLabel("Search").setWidth(600 / 3).setHeight(40).setId(1).activateEvent(true);
      c.addTab("tab2").setLabel("Portfolio").setWidth(600 / 3).setHeight(40).setId(2).activateEvent(true);
      c.addTab("tab3").setLabel("Algorithm").setWidth(600 / 3).setHeight(40).setId(3).activateEvent(true);
       
      // Setup of the SEARCH tab
      
      c.addTextlabel("search").setText("Search: ").setLabel("").setPosition(15, 55).setColor(0).moveTo("default");
      search = c.addTextfield("searchField").setLabel("").setPosition(65, 50).moveTo("default").setWidth(100);
      c.addButton("searchButton").setLabel("Search").setPosition(180, 50).setSize(50, 20).setId(4);
      
      // Moving to correct tabs
      
      c.getController("search").moveTo("default");
      c.getController("searchField").moveTo("default");
      c.getController("searchButton").moveTo("default");
      
    }
   
    public void draw() {
      background(255);
      if (tabState == 0) {
        line(0, 80, 800, 80);
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
      }
    }
    
    public void stop() {
      client.sendMessage("logout");
      exit(); 
    } 
  }  
}
