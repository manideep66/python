n = int(input("Enter a number: "))
s = 0.0
for i in range(1, n + 1):
    s += 1 / i
print("Sum:", s)