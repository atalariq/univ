# Nilai tengah bilangan bulat 3 digit

# Input: 100-999 (3 digit only)
x = int(input("Masukkan sebuah bilangan bulat berdigit 3 (100–999): "))

# Antisipasi apabila input tidak sesuai
if(x < 100 or x > 999):
    print("Nomor yang Anda masukkan tidak sesuai ketentuan!")
    print("Coba ulangi program dengan memasukkan sebuah bilangan berdigit 3!")
    exit()

# Mencari nilai tangah
nilai_tengah = (x // 10) % 10

print(f"Nilai tengah dari {x}: {nilai_tengah}")
