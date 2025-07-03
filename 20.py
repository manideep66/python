n = int(input("Enter a number:"))
s = 0
for i in range(1, n + 1, 2):
    print(i, end=' ')
    s += i
print("\nSum:", s)