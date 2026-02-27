# Penjumlahan tiap digit pada bilangan bulat berdigit 3

# Input: 100-999 (3 digit only)
x = int(input("Masukkan sebuah bilangan bulat berdigit 3 (100–999): "))

# Antisipasi untuk input yang tidak sesuai
if(x < 100 or x > 999):
    print("Nomor yang Anda masukkan tidak sesuai ketentuan!")
    print("Coba ulangi program dengan memasukkan sebuah bilangan berdigit 3!")
    exit()

# Mememcah masing-masing digit
satuan = x % 10                 # Digit satuan (paling kanan)
puluhan = (x // 10) % 10        # Digit puluhan (tengah)
ratusan = (x // 100) % 10       # Digit ratusan (paling kiri)

# Penjumlahan digit satuan, puluhan, dan ratusan
jumlah = ratusan + puluhan + satuan

print(f"Penjumlahan tiap digit pada bilangan {x}: {jumlah}")
