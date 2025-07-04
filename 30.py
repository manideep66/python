st=input()
st=list(st)
for i in range(len(st)//2):
    st[i], st[-(i + 1)] = st[-(i + 1)], st[i]
st = ''.join(st)
print(st)