from math import pi                     # Pakai konstanta PI dari library `math`

data = input().split()                  # User Input
data_float = list(map(float, data))     # Ubah input menjadi sebuah list dari tipe data float

r = data_float[0]                       # (r)adius -> jari-jari
h = data_float[1]                       # (h)eight -> tinggi

A = 2 * pi * r * (r + h)                # (A)rea -> luas permukaan tabung

print(f"Luas Permukaan tabung: {A}")    # Print luas permukaan tabung
