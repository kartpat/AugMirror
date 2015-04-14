


void scanFace(int tempX, int tempY, int tempWidth , int tempHeight, int faceNum){
        faze[faceNum].loadPixels();
        loadPixels();
        if(tempY<0) tempY=0;
        for (int i = 0 ; i< tempWidth*skale ; i++){
              for (int j = 0 ; j< tempHeight*skale ; j++){
                int loc = i + j*tempWidth*skale;
                int overLoc = (tempX*skale + i) + (tempY*skale+j)*width;
                if(overLoc >= width*height) overLoc = width*height -1;
                
                //println(alpha(pixels[overLoc]));
                faze[faceNum].pixels[loc] = pixels[overLoc];
              }
        }
        updatePixels();
        faze[faceNum].updatePixels();
        
        //image(faze[faceNum] , 10,10 , tempWidth , tempHeight);

}
      
        
