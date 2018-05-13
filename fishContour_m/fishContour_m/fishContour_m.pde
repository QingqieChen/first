import processing.video.*;
import gab.opencv.*;
import controlP5.*;


OpenCV opencv;
ControlP5 cp5;

Capture cam;
PImage img;

int thresholdMin = 0;
int thresholdMax = 4499;

ArrayList<Contour> contours;
ArrayList<Ball> balls = new ArrayList<Ball>();

void setup() {
  size(512, 424);

  


  String[] cameras = Capture.list();

  if (cameras.length == 0) {
  } else {
    println("Available cameras:");
    printArray(cameras);
    cam = new Capture(this, cameras[73]);
    cam.start();
  }      
  img = createImage(432, 240, ARGB); //not RGBA

  // Blank OpenCV Image
  opencv = new OpenCV(this, img);

}


void draw() {
  background(0);
  if ( cam.available() ) {
    cam.read();
    cam.loadPixels();

    opencv.loadImage(cam);
    opencv.gray();
    opencv.threshold(80);
    //opencv.erode();
    //opencv.dilate();
    //opencv.dilate();
    //opencv.erode();
    contours = opencv.findContours();
    //noFill();
    image(cam, 0, 0);


    for (Contour tempContour : contours) {

      stroke(200, 0, 20);
      strokeWeight(2);
      
      tempContour.draw();

      // check the code below
      
      for ( PVector point : tempContour.getPolygonApproximation().getPoints() ) {
        vertex(point.x, point.y);
      }
      
    }
  }

  //image(opencv.getOutput(), 0, 0);

  fill(255);
  text(frameRate, 10, 20);
}
