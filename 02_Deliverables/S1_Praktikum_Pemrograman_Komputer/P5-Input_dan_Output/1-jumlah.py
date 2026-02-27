first_line = input().split()                        # Input baris pertama
second_line = input().split()                       # Input baris kedua
data = list(map(int, first_line + second_line))     # Ubah input menjadi sebuah list integer
print(sum(data))                                    # Print jumlah keempat bilangan