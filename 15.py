n=int(input())
o=0
e=0
for i in range(n):
    if i%2==0:
        e+=i
    else:
        o+=i
print("sum of odd numbers=",o)        
print("sum of even numbers=",e)        

      