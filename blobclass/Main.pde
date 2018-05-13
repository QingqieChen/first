import processing.video.*;

Capture video;

color trackColor;
float threshold = 80;
float distThreshold = 75;

ArrayList<Blob> blobs = new ArrayList<Blob>();

void setup(){
  size(640,360);
  String[] cameras = Capture.list();
  printArray(cameras);
  video = new Capture(this,cameras[3]);
  video.start();
  trackColor = color(255,0,0);
}

void captureEvent{
  video.read();
}

void keyPressed(){
  
