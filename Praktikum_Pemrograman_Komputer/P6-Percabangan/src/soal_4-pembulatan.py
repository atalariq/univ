from math import ceil, floor

data = float(input("Masukkan angka: "))

# Use this trick, because there is floating point error
# For example:
# If we input 34.4 and save it to variable named data
# Then we do: data % 1 >= 0.4, it will return false.
# As 34.4 % 1 = 0.39999999999999996, not equal to 0.4.
# So we need to use trick to solve this issue.

if(data * 10 % 10 >= 4):
    print(f"{ceil(data)}")
else:
    print(f"{floor(data)}")
