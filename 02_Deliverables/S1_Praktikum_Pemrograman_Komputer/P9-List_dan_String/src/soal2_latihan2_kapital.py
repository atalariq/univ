# s = input()
# s = list(s)
#
# # Upper case the first letter
# if not (65 <= ord(s[0]) <= 90):
#     s[0] = chr(ord(s[0]) - (ord('a') - ord('A')))
#
# # Make lower case the rest
# for i in range(1, len(s)):
#     if 65 <= ord(s[i]) <= 90:
#         s[i] = chr(ord(s[i]) + (ord('a') - ord('A')))
#
# s = "".join(s)
# print(s)

s = list(input().lower())
# s[0] = chr(ord(s[0]) - (ord('a') - ord('A')))
s[0] = chr(ord(s[0]) - 32)
s = "".join(s)
print(s)

