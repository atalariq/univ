from math import sqrt

c = int(input())

for a in range(1, c):
    b_power = c ** 2 - a ** 2
    b = sqrt(b_power)

    # Check if b is perfect square
    if(int(b) ** 2 == b_power):
        print(f"{a} {int(b)}")
