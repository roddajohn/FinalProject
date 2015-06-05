public class MainFrame extends JFrame {
 private Client client; 
 
 // STILL HAVE TO DEAL WITH CLOSING ISSUES, ie, ALL WINDOWS CLOSED BUT IT IS STILL RUNNING
  
  public MainFrame(Client c) {
    client = c;
    setBounds(100, 75, 400, 300);
    PApplet p = new secondApplet();
    add(p);
    p.init();
    show();  
  }
  
  private class secondApplet extends PApplet {
    public void setup() {
      background(255); 
    }
   
    public void draw() {
     
    }
    public void stop() {
      client.sendMessage("logout");
      exit(); 
    } 
  }  
}
