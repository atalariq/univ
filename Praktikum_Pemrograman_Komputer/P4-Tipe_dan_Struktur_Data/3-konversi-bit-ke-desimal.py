biner = str(input("Masukkan sebuah bilangan biner: "))           # Input bilangan biner
desimal = 0                                                      # Varibel untuk menampung jawaban

# Jawaban 1: Menggunakan perulangan
for i in range(len(biner) - 1, -1, -1):
    if(biner[i] == "1"):                                         # Apabila digit biner ke-i bernilai 1,
        desimal += 2 ** i                                        # Lakukan perhitungan nilai desimal dengan menambahkan
                                                                 # 2^(n-1), dimana n merupakan urutan digit dari kanan

print(f"\nNilai desimal dari bilangan biner {biner}: {desimal}") # Output jawaban

