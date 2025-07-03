n=int(input())
fl=True
for i in range(2,(n//2)+1):
    if n%i==0:
        fl=False
        break
    else:
        fl=True
if fl:
    print("Prime")
else:
    print("Not a prime")