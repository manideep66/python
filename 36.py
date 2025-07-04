num = input("Enter number: ")
result = ''
for digit in num:
    n = (int(digit) + 1) % 10
    result += str(n)
print(result)