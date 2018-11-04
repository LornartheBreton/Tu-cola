import ddf.minim.*;

Minim minim;
AudioPlayer player;
int[] xN=new int [4];
//int[] yN=new int [4];
float[] speed=new float [4];
float multiplier=1;
float score=0;
boolean pause=false;
void setup(){
   minim = new Minim(this);
  player = minim.loadFile("song.mp3");
  size(900,600);
  for(int i=0;i<4;i++){
    xN[i]=int(random(900,1100));
    speed[i]=int(random(-8,-5));
  }
}
void draw(){
  if(pause==true){
    background (0);
    fill(0);
    strokeWeight(3);
    stroke(255,0,0);
    rect(50,100,75,75);
    stroke(0,255,0);
    rect(50,200,75,75);
    stroke(0,75,255);
    rect(50,300,75,75);
    stroke(255,255,0);
    rect(50,400,75,75);
    fill(255,0,0);
    stroke(255,0,0);
    rect(xN[0],100,75,75);
    fill(0,255,0);
    stroke(0,255,0);
    rect(xN[1],200,75,75);
    fill(0,0,255);
    stroke(0,0,255);
    rect(xN[2],300,75,75);
    fill(255,255,0);
    stroke(255,255,0);
    rect(xN[3],400,75,75);
    //float x1 = map( i, 0, player.bufferSize(), 0, width );
    for(int i=0;i<4;i++){
      xN[i]+=speed[i];
      if(xN[i]+75<=-20){
        xN[i]=int(random(900,1000));
        speed[i]=random(-8,-5)*multiplier;
      }
    }
    fill(255);
    textSize(50);
    text(score,500,50);
    stroke(255);
    
    
    //for(int i = 0; i < player.bufferSize() - 1; i++)
    //{
    //  float x1 = map( i, 0, player.bufferSize(), 0, width );
    //  float x2 = map( i+1, 0, player.bufferSize(), 0, width );
    //  line( x1, 50 + player.left.get(i)*50, x2, 50 + player.left.get(i+1)*50 );
    //  line( x1, 150 + player.right.get(i)*50, x2, 150 + player.right.get(i+1)*50 );
    //}
    if ( player.position() == player.length() )
    {
      exit();
    }
  }
}

void keyPressed(){
  if((key=='a'||key=='A')&&(xN[0]>=30&&xN[0]<=50+75)){
    multiplier+=0.01;
    score+=100*multiplier;
    println("yes");
  }
  if((key=='s'||key=='S')&&(xN[1]>=30&&xN[1]<=50+75)){
    multiplier+=0.01;
    score+=100*multiplier;
    println("yes");
  }
  if((key=='d'||key=='D')&&(xN[2]>=30&&xN[2]<=50+75)){
    multiplier+=0.01;
    score+=100*multiplier;
    println("yes");
  }
  if((key=='f'||key=='F')&&(xN[3]>=30&&xN[3]<=50+75)){
    multiplier+=0.01;
    score+=100*multiplier;
    println("yes");
  }
  if ( player.isPlaying()==true && key=='p')
  {
    player.pause();
    pause=false;
  }
  if ( player.isPlaying()==false && key=='o')
  {
    player.play();
    pause=true;
  }
}
