n = int(input("Enter a number: "))
fac = 1
while n > 1:
    fac *= n
    n -= 1
print("fac:", fac)