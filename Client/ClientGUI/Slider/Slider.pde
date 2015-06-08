// slidercode taken from andreas shlegel, creator of CP5

import controlP5.*;

ControlP5 cp5;
int myColor = color(0,0,0);

int sliderValue = 100;
int sliderTicks1 = 100;
int sliderTicks2 = 30;
Slider abc;

void setup() {
  size(700,400);
  noStroke();
  cp5 = new ControlP5(this);
  
  // add a horizontal sliders, the value of this slider will be linked
  // to variable 'sliderValue' 
  cp5.addSlider("sliderValue")
     .setPosition(100,50)
     .setRange(0,255)
     ;
  
  // create another slider with tick marks, now without
  // default value, the initial value will be set according to
  // the value of variable sliderTicks2 then.
  cp5.addSlider("sliderTicks1")
     .setPosition(100,140)
     .setSize(20,100)
     .setRange(0,255)
     .setNumberOfTickMarks(5)
     ;
     
 
  
  // reposition the Label for controller 'slider'
  cp5.getController("slider").getValueLabel().align(ControlP5.LEFT, ControlP5.BOTTOM_OUTSIDE).setPaddingX(0);
  cp5.getController("slider").getCaptionLabel().align(ControlP5.RIGHT, ControlP5.BOTTOM_OUTSIDE).setPaddingX(0);
  

  cp5.addSlider("sliderTicks2")
     .setPosition(100,370)
     .setWidth(400)
     .setRange(255,0) // values can range from big to small as well
     .setValue(128)
     .setNumberOfTickMarks(7)
     .setSliderMode(Slider.FLEXIBLE)
     ;
  // use Slider.FIX or Slider.FLEXIBLE to change the slider handle
  // by default it is Slider.FIX
  

}

void draw() {
  background(sliderTicks1);

  fill(sliderValue);
  rect(0,0,width,100);
  
  fill(myColor);
  rect(0,280,width,70);
  
  fill(sliderTicks2);
  rect(0,350,width,50);
}

void slider(float theColor) {
  myColor = color(theColor);
  println("a slider event. setting background to "+theColor);
}

