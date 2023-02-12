//+------------------------------------------------------------------+
//|                                              Calculate_Angle.mqh |
//|                                  Copyright 2021, MetaQuotes Ltd. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Copyright 2021, MetaQuotes Ltd."
#property link      "https://www.mql5.com"
#property version   "1.00"
class Calculate_Angle
  {
private:
 
   int x1,x2;
   int y1,y2;
public:
                    // Calculate_Angle();
                   // ~Calculate_Angle();
   virtual double read_angle(double price1,long time1,double price2,long time2);
   double result;
  };
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
//Calculate_Angle::Calculate_Angle()
//  {
//  
//  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
////Calculate_Angle::~Calculate_Angle()
////  {
////  }
//+------------------------------------------------------------------+
double Calculate_Angle:: read_angle(double price1,long time1,double price2,long time2)
{
x1=0;
x2=0;
y1=0;
y2=0;
result=0;
  long chart        =ChartGetInteger(0,CHART_HEIGHT_IN_PIXELS,0);
                     ChartTimePriceToXY(0,0,time1,price1,x1,y1);
                     ChartTimePriceToXY(0,0,time2,price2,x2,y2);
   int size          =(int)chart;
   y1=size-y1;
   y2=size-y2;
    double angle=NormalizeDouble((MathArctan(((double)y2-(double)y1)/((double)x2-(double)x1))*180)/M_PI,1);
   result= angle;
   return(result);
}