float[] angle;

float[] x;
float[] y;

int nr=0;

int nr2=2;
float sumpozx[];
float sumpozy[];
int dim=100;

float[] pointx;

float[] pointy;


void setup() {
  angle=new float[10000];
  sumpozx=new float[10000];
  sumpozy=new float[10000];
  sumpozx[0]=200;
  sumpozy[0]=200;
  x= new float[10000];
  y= new float[10000];
  for(int i=0;i<9;i++){
  angle[i]=0;
  }
  size(800, 600);
  
 pointx=new float[500];
pointy=new float[500];
}

void draw() {
  if(nr2<1){nr2=1;}
  background(0);
  stroke(255);
  //strokeWeight(2);
 for(int i=1;i<pointx.length;i++){
    pointx[i]+=0.99;
    //point(pointx[i],pointy[i]);
    if(abs(pointx[i]-pointx[i-1])<5){
    line(pointx[i],pointy[i],pointx[i-1],pointy[i-1]);}
   //line(pointx[i],pointy[i],pointx[i-1],pointy[i-1]);
  }
  //capetele la linii
  for (int i=0;i<nr2-1;i++){
  x[i]=(dim/(((i+1)*2)-1))*cos(angle[i]);
  y[i]=(dim/(((i+1)*2)-1))*sin(angle[i]);
  //print(x[i]," ");
  strokeWeight(1);
  stroke(60);
  noFill();
  sumpozx[i+1]=sumpozx[i] + x[i];
  sumpozy[i+1]=sumpozy[i] + y[i];
  //print(sumpozx[i+1]," ");
  
  circle(sumpozx[i],sumpozy[i],2*dim/(((i+1)*2)-1));
  stroke(255);
  line(sumpozx[i]+x[i],sumpozy[i]+y[i],sumpozx[i],sumpozy[i]);
  angle[i]-=0.02*(((i+1)*2)-1);
  }
  line(sumpozx[nr2-1],sumpozy[nr2-1],500,sumpozy[nr2-1]);

  
  
  pointx[nr]=500;
  pointy[nr]=sumpozy[nr2-1];

  nr++;
  if(nr>399){nr=0;}
  fill(0,100,0);
  rect(10,500,80,80);
  fill(1000,0,0);
  rect(90,500,80,80);
  fill(0,200,0);
  rect(350,500,80,80);
  fill(200,0,0);
  rect(430,500,80,80);
  
  textSize(50);
  fill(255);
  text(nr2-1,200,550);
  

}

void mousePressed(){
  if((mouseX>10)&(mouseX<90)&(mouseY>500)&(mouseX<580)){
  nr2++;
    for(int i=0;i<=nr2;i++){
  angle[i]=0;
  }

}
 if((mouseX>350)&(mouseX<430)&(mouseY>500)&(mouseX<580)){
  nr2+=50;
    for(int i=0;i<=nr2;i++){
  angle[i]=0;
  }

}
  if((mouseX>90)&(mouseX<170)&(mouseY>500)&(mouseX<580)){nr2--;}
  if((mouseX>430)&(mouseX<510)&(mouseY>500)&(mouseX<580)){nr2-=50;}

}
