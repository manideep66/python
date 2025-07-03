cp,sp=list(map(int,input().split()))
if cp>sp:
    print("Loss of Rs.",cp-sp)
elif cp<sp:
    print("Profit of Rs.",sp-cp)
else:
    print("No profit No loss")