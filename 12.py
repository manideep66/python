ch=input()
if ord(ch)>=65 and ord(ch)<=90:
    print("Uppercase")
elif ord(ch)>=97 and ord(ch)<=122:
    print("Lowercase")
elif ord(ch)>=48 and ord(ch)<=57:
    print("Digit")
else:
    print("Special Character")