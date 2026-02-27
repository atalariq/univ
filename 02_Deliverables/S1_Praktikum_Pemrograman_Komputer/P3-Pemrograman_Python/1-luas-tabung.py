# Hitung luas tabung

from math import pi as PI   # Import konstanta PI dari library `math`
r = 10                      # Jari-jari tabung -> radius (r),
h = 40                      # Tinggi tabung -> height (h)

# Luas tabung -> Area (A)
A = 2 * (PI * r * r) + (PI * 2 * r) * h

# Print luas tabung
print(f"Luas Tabung: {A}")
