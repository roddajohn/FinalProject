import controlP5.*;
import javax.swing.*;

public class MainFrame extends JFrame {
  private final int w = 600;
  private final int h = 400;  
  
  private Client client; 
  private ControlP5 c;
 
  // STILL HAVE TO DEAL WITH CLOSING ISSUES, ie, ALL WINDOWS CLOSED BUT IT IS STILL RUNNING
  
  public MainFrame(Client c) {
    client = c;
    setBounds(0, 0, w, h);
    this.setResizable(false);
    PApplet p = new secondApplet();
    add(p);
    p.init();
    show();  
  }
  
  private class secondApplet extends PApplet {
    public void setup() {
      background(255); 
      c = new ControlP5(this);
      
      c.getTab("default").activateEvent(true).setLabel("Search for Stock").setId(1).setWidth(w / 3).setHeight(20);
      c.addTab("portfolio").activateEvent(true).setLabel("View your Portfolio").setId(2).setWidth(w / 3).setHeight(20);
      c.addTab("algorithm").activateEvent(true).setLabel("View your Automated Trading Settings").setWidth(w / 3).setHeight(20);
      
      
      
    }
   
    public void draw() {
     
    }
    
    
    public void stop() {
      client.sendMessage("logout");
      exit(); 
    }
  }  
}
