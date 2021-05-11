int starunit = 40;
//运动范围
int count=0;
StarModule[] stars;
int ridis = 200;
float acc =0;

void setup(){
  //size(800,800);
  fullScreen();
  noStroke();
  int wideCount = width/starunit;
  int highCount = height/starunit;
  //每个star所能占用的最大width和height
  count = wideCount*highCount;
  //star的总数由x相乘得到
  stars = new StarModule[count];
  //直到这里才确定了star的最终数量
  int index = 0;
  int randomX = 0;
  int randomY = 0;
  for (int i=0; i< count; i++){
    randomX = ridis-int(random(0,1)*2*ridis);
    randomY = ridis-int(random(0,1)*2*ridis);
    stars[index++] = new StarModule(randomX+width/2, randomY+height/2 ,width, height);
    //stars[index++] = new StarModule(int(random(0,width)), int(random(0,height)) ,width, height);
    }
}

void draw(){
  background(0);
  for(StarModule star : stars){
   acc = map(mouseX, 0,width,0,1);
   star.UpdateLiner();
   star.UpdateSize(0.01);
   star.UpdateSpiral(acc);
   //star.UpdateSpiral2(acc);
   //star.UpdateGravity(acc);
   star.UpdateLimitCheck(4);
   star.display(); //<>//
  }
}
