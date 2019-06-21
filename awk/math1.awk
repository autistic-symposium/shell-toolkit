
# awk -f math1
{
no1 = $1
no2 = $2
ans = $1 + $2
print no1 " + " no2 " = " ans
}