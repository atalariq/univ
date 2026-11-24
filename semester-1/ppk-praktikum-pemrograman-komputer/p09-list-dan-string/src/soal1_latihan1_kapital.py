s = input()

cnt: int = 0
for i in range(len(s)):
    # 65 = 'A' in ASCII table
    # 90 = 'Z' in ASCII table
    if 65 <= ord(s[i]) <= 90:
        cnt += 1

print(cnt)
