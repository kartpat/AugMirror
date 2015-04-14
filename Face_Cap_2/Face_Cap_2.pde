

import gab.opencv.*;
import processing.video.*;
import java.awt.*;


//PImage faze = createImage(200,150,RGB);
PImage[] faze = new PImage [25];

Capture video;
OpenCV opencv;

int timeCount = 0;
int skale = 2;
//int lenFace = 0;


void setup() {
  
  size(640*skale, 480*skale);
  
  
  video = new Capture(this, 640, 480);
  opencv = new OpenCV(this, 640, 480);
  opencv.loadCascade(OpenCV.CASCADE_FRONTALFACE);
  video.start();
}

void draw() {
  scale(skale);
  opencv.loadImage(video);

  image(video, 0, 0 );
  Rectangle[] faces = opencv.detect();
  
  
  // if(millis() - timeCount > 40){       
  //          // lenFace = faces.length;
  //           timeCount = millis();
            
            
      
   
 
   
  //println(faces.length);
  
  noFill();
  stroke(10);
  for (int i = 0; i < faces.length; i++) {
     
    //rect(faces[i].x, faces[i].y - int(0.25*faces[i].height), faces[i].width, int(faces[i].height*1.3));
           //ellipse(width/4, height/4 , 20 ,20);
          // println(faces[i].x + "," + faces[i].y);
          //println(faces[i].width + "," + faces[i].height);
           //rect(faces[i].x, faces[i].y, faces[i].width, faces[i].height);
          // stroke(0,255,0);
          // noFill();
          // rect(faces[i].x, faces[i].y, faces[i].width, faces[i].height);
          // if (!faceSent){
            
            
          if(faces.length>1){  
                faze [i] = createImage(skale*faces[i].width, skale*ceil(faces[i].height*1.3),RGB);
                
                //println(faces[i].y - ceil(0.25*faces[i].height));
                scanFace(faces[i].x, faces[i].y - ceil(0.25*faces[i].height), faces[i].width, ceil(faces[i].height*1.3) , i);      
          }
          
    }
    
    if (faces.length > 1 ){
      
      
      
      for (int nume = 0 ; nume < faces.length ; nume++){
          float sepa = dist(faces[(nume+1)%faces.length].x, faces[(nume+1)%faces.length].y, faces[(nume)%faces.length].x, faces[(nume)%faces.length].y);
          println("Separation: "+sepa);
          float mape = map(sepa, 50*skale ,125*skale, 220, 130);
          float rand = map( sepa,50*skale ,125*skale, 254, 50);
          println("Rand: "+rand);
          tint(random(255,rand),random(255,rand),mape, mape);
          image(faze[nume % faces.length] , faces[(nume+1)%faces.length].x, faces[(nume+1)%faces.length].y - ceil(0.25*faces[(nume+1)%faces.length].height), faces[(nume+1)%faces.length].width, ceil(faces[(nume+1)%faces.length].height*1.3));
      
      }
      
     
      
      //noTint();
    }
     
}


void captureEvent(Capture c) {
  c.read();
}



void keyPressed(){
}
