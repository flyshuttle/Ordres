int lineColor_r = 0;
int lineColor_b = 0;
int lineColor_g = 0;
int rectSize = 50;

int randomDis(int x,int dis)
{
  //some rate return x
  if(int(random(4)) == 3)
  {
    return x+int(random(-dis,dis)); 
  }
 return x;
}
//draw doudong rect
void drawRect_douDong(int x,int y,int wid,int hei)
{
  int randomDis = 4;
  int pt1X = randomDis(x,randomDis);
  int pt1Y = randomDis(y,randomDis);
  int pt2X = randomDis(x+wid,randomDis);
  int pt2Y = randomDis(y,randomDis);
  int pt3X = randomDis(x+wid,randomDis);
  int pt3Y = randomDis(y+hei,randomDis);
  int pt4X = randomDis(x,randomDis);
  int pt4Y = randomDis(y+hei,randomDis);
  //random color

  int iRand = int(random(4));
  if(iRand == 0)
  {
    stroke(lineColor_r,lineColor_b,lineColor_g,90);
  }else if(iRand == 1)
  {
    stroke(lineColor_r,lineColor_b,lineColor_g,80);
  }else if(iRand == 2)
  {
    stroke(lineColor_r,lineColor_b,lineColor_g,70);
  }else
  {
    stroke(lineColor_r,lineColor_b,lineColor_g,99);
  }
  
  line(pt1X,pt1Y,pt2X,pt2Y);
  line(pt2X,pt2Y,pt3X,pt3Y);
  line(pt3X,pt3Y,pt4X,pt4Y);
  line(pt4X,pt4Y,pt1X,pt1Y);
}

//draw random rect
void drawRandomRect(int x,int y,int wid,int hei)
{
  //random num
  int num = int(random(6))+1;
  for(int i=0;i<num;++i)
  {
   int offDis = int(random(wid));//offsetDis
   //drawRect(x+offDis,y+offDis,wid-offDis*2,hei-offDis*2);
   drawRect_douDong(x+offDis,y+offDis,wid-offDis*2,hei-offDis*2);
  }
}

void setup()
{   
  size(2500,1000);
  background(255);//draw rect white
  
  smooth();
  strokeWeight(2);
  //draw grid
  for(int i=0;i<2500/rectSize;++i)
  {
    for(int jj = 0;jj<1000/rectSize;++jj)
    {
      //drawRect(i*rectSize,jj*rectSize,rectSize,rectSize); //draw a rect
      //Random Rect
      drawRandomRect(i*rectSize,jj*rectSize,rectSize,rectSize);
    }
  }
}
