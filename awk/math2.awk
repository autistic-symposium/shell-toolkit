# awk -f math2

BEGIN {
  myprompt = "(To Stop press CTRL+D) > "
  printf "Welcome to MyAddtion calculation awk program v0.1\n"
  printf "%s" ,myprompt
}

{
no1 = $1
op = $2
no2 = $3
ans = 0

if ( op == "+" )
{
     ans = $1 + $3
     printf "%d %c %d = %d\n" ,no1,op,no2,ans
     printf "%s" ,myprompt
 }
 else
 {
     printf "Opps!Error I only know how to add.\nSyntax: number1 + number2\n"
     printf "%s" ,myprompt
  }
}

END {
    printf "\nGoodbye, %s\n !" , ENVIRON["USER"]
}