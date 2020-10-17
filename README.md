https://mp.weixin.qq.com/s/ErKb3nfNOS3FxYNFXP3CQw
Vera Molnár是匈牙利裔法国媒体艺术家，她被认为是计算机艺术的先驱。
这幅作品名叫《Ordres》，这次笔者就用Processing自动生成这种风格的画。



//中间线条的三个色值
int lineColor_r = 0;
int lineColor_b = 0;
int lineColor_g = 0;
//每个单元格的大小
int rectSize = 50;
//求得一个随机数
int randomDis(int x,int dis)
{
  if(int(random(4)) == 3){
        return x+int(random(-dis,dis)); 
  }else{
        return x;
  } 
}
//绘制抖动的矩形
void drawRect_Shake(int x,int y,int wid,int hei)
{
  int randomDis = 4;
  //四个抖动后的端点XY坐标
  int pt1X = randomDis(x,randomDis);
  int pt1Y = randomDis(y,randomDis);
  int pt2X = randomDis(x+wid,randomDis);
  int pt2Y = randomDis(y,randomDis);
  int pt3X = randomDis(x+wid,randomDis);
  int pt3Y = randomDis(y+hei,randomDis);
  int pt4X = randomDis(x,randomDis);
  int pt4Y = randomDis(y+hei,randomDis);
  //随机透明度
  int iRand = int(random(4));
  if(iRand == 0){
        stroke(lineColor_r,lineColor_b,lineColor_g,90);
  }else if(iRand == 1){
        stroke(lineColor_r,lineColor_b,lineColor_g,80);
  }else if(iRand == 2){
        stroke(lineColor_r,lineColor_b,lineColor_g,70);
  }else{
        stroke(lineColor_r,lineColor_b,lineColor_g,99);
  }
  //画线
  line(pt1X,pt1Y,pt2X,pt2Y);
  line(pt2X,pt2Y,pt3X,pt3Y);
  line(pt3X,pt3Y,pt4X,pt4Y);
  line(pt4X,pt4Y,pt1X,pt1Y);
}
//遍历每个单元格内的方块线条
void drawRandomRect(int x,int y,int wid,int hei)
{
  //每个单元格内的方块个数是随机的
  int num = int(random(6))+1;
  for(int i=0;i<num;++i){
       int offDis = int(random(wid));//偏移距离
       drawRect_Shake(x+offDis,y+offDis,wid-offDis*2,hei-offDis*2);
  }
}
//主函数
void setup()
{   
  size(2500,1000);//画布尺寸
  background(255);//画布背景颜色色号
  smooth();//设置线条为平滑模式
  strokeWeight(2);//设置线条宽度
  //遍历横向和竖向，绘制一个个的单元
  for(int i=0;i<2500/rectSize;++i)
  {
        for(int jj = 0;jj<1000/rectSize;++jj)
        {
              drawRandomRect(i*rectSize,jj*rectSize,rectSize,rectSize);
        }
  }
}
