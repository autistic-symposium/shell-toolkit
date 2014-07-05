# awk -f for_loop.awk

BEGIN {
   printf "To test for loop\n"
   printf "Press CTRL + C to stop\n"
 }
 {
  for(i=0;i<NF;i++)
  {
       printf "Welcome %s, %d times.\n" ,ENVIRON["USER"], i
  }
}