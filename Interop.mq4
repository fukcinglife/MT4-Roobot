#include "Trade.mq4"
#include "Retrieve.mq4"

string symbol;
bool postclose_done = false;

int init()
{
   ObjectsDeleteAll(ChartID());

   Comment(AccountCompany());
   
   Retrieve();

   return(0);
}

int start()
{
   Retrieve();

   string res = "";

   int handle=FileOpen(Symbol() + "/" + TimeSeconds(TimeLocal()) + ".txt", FILE_READ | FILE_WRITE);
   if(handle>0)
   {
      FileWrite(handle, Ask + " " + Bid);
      FileClose(handle);
   }

   Trade();

   return(0);
}

