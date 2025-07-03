a,b,c=list(map(int,input().split(",")))
if a>b and a>c:
    print(a,"is greater than",b," and ",c)
elif b>a and b>c:
    print(b,"is greater than",a," and ",c)
elif c>b and c>a:
    print(c,"is greater than",a," and ",b)
else:
    print("all are equal")