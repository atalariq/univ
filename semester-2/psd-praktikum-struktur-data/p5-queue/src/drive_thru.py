# drive_thru.py
# Implementasi studi kasus drive thru untuk materi Queue
# Menggunakan Python built-in array/list.

class DriveThruItem:
    def __init__(self, plat_nomor, pesanan):
        self.plat_nomor = plat_nomor
        self.pesanan = pesanan

    def __str__(self):
        return f"Plat: {self.plat_nomor}. Pesanan: {self.pesanan}"

class DriveThruQueue:
    #? Constructor
    def __init__(self) -> None:
        self.antrean = list()

    #? IsEmpty
    def is_empty(self):
        return len(self.antrean) == 0

    #? IsFull
    def is_full(self):
        ANTRIAN_MAX = 5
        return len(self.antrean) == ANTRIAN_MAX

    #? Enqueue
    def tambah(self, plat_nomor, pesanan):
        if self.is_full():
            print("> Mohon maaf, jalur Drive-Thru penuh. Silakan parkir di dalam.")
            return
        new_antrean = DriveThruItem(plat_nomor, pesanan)
        print(f"+ Kendaraaan plat {new_antrean.plat_nomor} masuk antrean!")
        self.antrean.append(new_antrean)

    #? Dequeue
    def layani(self):
        if self.is_empty():
            print("> Tidak ada kendaraan di antrean.")
            return
        first = self.antrean[0]
        print(f"- Kendaraaan plat {first.plat_nomor} telah dilayani!")
        self.antrean = self.antrean[1:]

    #? Front
    def cek(self):
        if self.is_empty():
            print("> Tidak ada kendaraan di antrean.")
            return
        first = self.antrean[0]
        print("(i) Antrean pertama -> ", first)

    #? Display
    def tampilkan(self):
        if self.is_empty():
            print("> Tidak ada kendaraan di antrean.")

        print("Kendaraan dalam antrean saat ini:")
        for i in range(len(self.antrean)):
            print("*)", self.antrean[i])

if __name__ == "__main__":
    antrean = DriveThruQueue()
    antrean.tambah('AB 1234 CD', 'Es Teh 1x')
    antrean.tambah('AD 1964 SL', 'Martabak 1x')
    antrean.cek()

    antrean.tambah('AE 1358 GG', 'Ayam Crispy 1x')
    antrean.tambah('AA 2345 JG', 'Steak 1x')
    antrean.tambah('H 9999 AI', 'Es Jeruk 1x')

    antrean.tambah('B 6666 SK', 'Siomay 1x')
    antrean.tampilkan()

    antrean.cek()
    antrean.layani()
    antrean.cek()

    antrean.tambah('B 6666 SK', 'Siomay 1x')
    antrean.tampilkan()
