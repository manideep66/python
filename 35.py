num = input("Enter number:")
length = len(num)
for i in range(length):
    digit = int(num[i])
    val = 10 ** (length - 1 - i)
    print(digit ,"*", val ,"=", digit, "*", val)