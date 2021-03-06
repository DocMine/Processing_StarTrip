class StarModule {
  int xOffset;
  int yOffset;
  //初始位置
  float x, y;
  int Xlimit;
  int Ylimit;
  int xDirection = 1;
  int yDirection = 1;
  float Xspeed;
  float Yspeed;
  float SizeSpeed = 0.05;
  //float Accelrate = 0.001;
  float StarSize = 4;
  int MaxSize = 20;
  int MinSize = 2;
  int maxspeed = 20;
  
  
  // Contructor 构造器，这个函数用于实例化一个StarModule对象
  StarModule( int xOffsetTemp, int yOffsetTemp, int XlimitTemp, int YlimitTemp) {
    xOffset = xOffsetTemp;
    yOffset = yOffsetTemp;
    x = xOffset;
    y = yOffset;
    //指定【初始位置】
    Xlimit = XlimitTemp;
    Ylimit = YlimitTemp;
    //目前位置
    Xspeed  = map(xOffset-Xlimit/2,-Xlimit/2,Xlimit/2, -maxspeed,maxspeed);
    Yspeed  = map(yOffset-Ylimit/2,-Ylimit/2,Ylimit/2, -maxspeed,maxspeed);
    println("Xspeed",Xspeed);
    println("Yspeed",Yspeed);  
    //运动边界，这里可以直接引入width和height
  }
  
  // Custom method for updating the variables
  void UpdateLiner() {
    x = x + Xspeed;
    y = y + Yspeed;
  }

  void UpdateSize(float SizeSpeed) {
    StarSize += SizeSpeed;
  }

  void Update4Gravity(float Accelrate) {
    //这一步决定每个粒子怎么运动
    if(Xspeed>0) Xspeed += Accelrate;
    else Xspeed -= Accelrate;
    if(Yspeed>0) Yspeed += Accelrate;
    else Yspeed -= Accelrate;
  }

  void UpdateGravity(float Accelrate) {
    //这一步决定每个粒子怎么运动
    Yspeed += Accelrate;
  }

  void UpdateSpiral(float SpiralAccelrate) {
    //螺旋
    if(x<Xlimit/2 && y<Ylimit/2) {//1
      Xspeed += SpiralAccelrate;
      //Yspeed += SpiralAccelrate;
    }else if (x>Xlimit/2 && y<Ylimit/2){//2
      //Xspeed -= SpiralAccelrate;
      Yspeed += SpiralAccelrate;
    }else if (x>Xlimit/2 && y>Ylimit/2){//3
      Xspeed -= SpiralAccelrate;
      //Yspeed -= SpiralAccelrate;
    }else if (x<Xlimit/2 && y>Ylimit/2){//4
      //Xspeed += SpiralAccelrate;
      Yspeed -= SpiralAccelrate;
    }
  }
  
  void UpdateBounce(float SpiralAccelrate) {
    //弹跳
    float xAcc = abs(x-Xlimit/2)*SpiralAccelrate;
    float yAcc = abs(y-Ylimit/2)*SpiralAccelrate;
    
    if(x<Xlimit/2 && y<Ylimit/2) {//1
      Xspeed += xAcc;
      Yspeed += yAcc;
    }else if (x>Xlimit/2 && y<Ylimit/2){//2
      Xspeed -= xAcc;
      Yspeed += yAcc;
    }else if (x>Xlimit/2 && y>Ylimit/2){//3
      Xspeed -= xAcc;
      Yspeed -= yAcc;
    }else if (x<Xlimit/2 && y>Ylimit/2){//4
      Xspeed += xAcc;
      Yspeed -= yAcc;
    }
  }

  void UpdateSpiral2(float SpiralAccelrate) {
    //这一步决定每个粒子怎么运动
    //类似横8的轨迹运动
    if(x>Xlimit/2) Xspeed -= SpiralAccelrate;
    else Xspeed += SpiralAccelrate;
    if(y>Ylimit/2) Yspeed -= SpiralAccelrate;
    else Yspeed += SpiralAccelrate;
    //首先依据各轴速度更新x，y的位置
  }

  void UpdateLimitCheck(int OriginSize) {
    if(x > Xlimit || x<0 || y > Ylimit || y<0){
      x = xOffset;
      y = yOffset;
      Xspeed  = map(xOffset-Xlimit/2,-Xlimit/2,Xlimit/2, -maxspeed,maxspeed);
      Yspeed  = map(yOffset-Ylimit/2,-Ylimit/2,Ylimit/2, -maxspeed,maxspeed);
      //无论xy过界都回复到原始位置；
      StarSize = OriginSize;
    }
  }
  
  // Custom method for drawing the object
  void display() {
    fill(255);
    ellipse( int(x), int(y), StarSize, StarSize);
  }
}
