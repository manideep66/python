n = int(input("Enter a number:"))
s = str(n)
count = 0
for digit in s:
    if digit in '2357':
        count += 1
print("Sum:", count)