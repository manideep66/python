n = int(input("Enter a number:"))
while n >= 10:
    s = 0
    while n > 0:
        s += n % 10
        n //= 10
    n = s
print("The sum is:", n)