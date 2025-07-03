n=int(input())
sum=0
for i in range(n-1):
    sum+=i+1
    print(i+1,end=',')
sum+=n
print(n)
print(sum)