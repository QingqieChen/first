class Blob{
  float minx;
  float miny;
  float maxx;
  float maxy;
  
  ArrayList<PVector> points;
  
  Blob(float x, float y){
    point = new ArrayList<PVector>();
    minx =x;
    miny =y;
    maxx =x;
    maxy =y;
  }
  
  void show(){
    stroke(0);
    fill(255);
    strokeWeight(2);
    rectMode(CORNERS);
    rect(minx,miny,maxx,maxy);
  }
  void add(float x, float y){
    PVector v = new PVector(x,y);
    points.add(v);
    minx = min(minx,x);
    miny = min(miny,y);
    maxx = max(maxx,x);
    maxy = max(maxy,y);
  }
  
  float size(){
    return (maxx-minx)*(maxy-miny);
  }
  
  boolean isNear(float x, float y){
    float cx = (minx+maxx)/2;
    
