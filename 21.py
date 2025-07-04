a,b=list(map(int,(input().split())))
for i in range(a,b+1):
    f1=True
    if i < 2:
        continue
    for j in range(2,(i//2)+1):
        if i%j==0:
            f1=False
            break
    if f1:
        print(i,end=' ')