S = str(input("Masukkan sebuah bilangan biner: "))  # Input bilangan biner

# Jawaban 1: Menggunakan method count()
print("======================== Cara 1:")           # Dekorasi
print(f"Banyak bit bernilai 1: {S.count('1')}")     # Output Jawaban

# Jawaban 2: Memakai perulangan
print("======================== Cara 2:")
ans = 0                                             # Varible untuk menampung jawaban
for i in range(0, len(S)):
    if(S[i] == "1"):
        ans += 1                                    # Tambah 1 pada jawaban apabila digit biner bernilai 1

print(f"Banyak bit bernilai 1: {ans}")              # Output jawaban

