data = [int(input(f"Masukkan data ke-{i+1}: ")) for i in range(3)]
data.sort()
print(f"Nilai terbesar adalah {data[-2]}")
