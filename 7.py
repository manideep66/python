bill,age=list(map(int,input("enter bill amount and age:").split()))
if age>50:
    print("bill amount =",bill-((5/100)*bill))
else:
    print("bill amount=",bill)