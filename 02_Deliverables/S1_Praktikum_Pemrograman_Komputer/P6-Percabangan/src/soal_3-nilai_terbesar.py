data = input("Masukkan angka: ").split()
data = list(map(int, data))

# Method 1: Use max() function to find the maximum value in the list
# print(f"Nilai terbesar adalah {max(data)}")

# Method 2: Use conditional statement to check maximum value of the list manually

# First, think that first value as the biggest one
nilai_terbesar = data[0]

# Next, compare the second value with the biggest one. If it bigger, then change biggest one to it
if(data[1] > nilai_terbesar):
    nilai_terbesar = data[1]

# Last, compare the third value with the biggest one. If it bigger, then change biggest one to it
if(data[2] > nilai_terbesar):
    nilai_terbesar = data[2]

# Print the biggest one
print(f"Nilai terbesar adalah {nilai_terbesar}")
