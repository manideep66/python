k=1
for i in range(1,6):
    n=1
    for j in range(k):
        print(n,end=' ')
        n+=1
    n-=1
    for j in range(k-1):
        n-=1
        print(n,end=' ') 
    print()
    k+=1
