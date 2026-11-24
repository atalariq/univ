tanggal = input("Masukkan tanggal (DD MM YYYY): ").split()
[hari, bulan, tahun] = map(int, tanggal)

isValid: bool = True

# Kalau nggak sesuai format tanggal
if tahun < 0 or bulan < 1 or bulan > 12 or hari < 1:
    isValid = False
# 10 Hari yang hilang pada kalendar Gregorian (tanggal 5-14 Oktober 1582)
elif tahun == 1582 and bulan == 10 and hari in range(5, 15):
    isValid = False
# Bulan dengan 31 hari (Januari, Maret, Mei, Juli, Agustus, Oktober, Desember)
elif bulan in [1, 3, 5, 7, 8, 10, 12] and hari > 31:
    isValid = False
# Bulan dengan 30 hari (April, Juni, September, November)
elif bulan in [4, 6, 9, 11] and hari > 30:
    isValid = False
# Khusus Februari, bisa 28 atau 29 hari (tahun kabisat/leap year)
elif bulan == 2:
    if tahun % 4 == 0 and tahun % 100 != 0 or tahun % 400 == 0:
        if hari > 29:
            isValid = False
    else:
        if hari > 28:
            isValid = False

print("valid" if isValid else "tidak valid")
