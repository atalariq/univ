# queue_modified.py

# Implementasi Queue dengan array/list bawaan Python
class Queue:
    def __init__(self):
        self.data = []

    def enqueue(self, item):
        self.data.append(item)

    def dequeue(self):
        if self.is_empty():
            return None
        return self.data.pop(0)

    def peek(self):
        if self.is_empty():
            return None
        return self.data[0]

    def next_item(self):
        if len(self.data) < 2:
            return None
        return self.data[1]

    def size(self):
        return len(self.data)

    def is_empty(self):
        return len(self.data) == 0


def main():
    antrean = Queue()

    while True:
        # clear screen agar tidak menumpuk (referensi: https://stackoverflow.com/questions/2084508)
        print("\033c", end="")

        # Tampilkan daftar menu
        print("Antrean - Menu:")
        print("1. Tambah Antrian")
        print("2. Tampilkan Jumlah Antrian")
        print("3. Tampilkan Antrian Saat Ini")
        print("4. Hapus Antrian")
        print("5. Keluar")

        # Handle input menu
        pilihan = input("Pilih menu (1-5): ").strip()
        print() # print baris baru supaya lebih enak dibaca

        # Handle tambah_antrean
        if pilihan == "1":
            nama = input("Masukkan antrian: ").strip()
            if nama:
                antrean.enqueue(nama)
                print(f"{nama} berhasil ditambahkan.")
            else:
                print("Nama tidak boleh kosong.")

        # Handle tampilkan_jumlah_antrean
        elif pilihan == "2":
            print(f"Jumlah antrian saat ini: {antrean.size()}")

        # Handle tampilkan_antrian
        elif pilihan == "3":
            if antrean.is_empty():
                print("Antrian kosong.")
            else:
                print(f"Antrian saat ini: {antrean.peek()}")
                next_item = antrean.next_item()
                if next_item:
                    print(f"Antrian selanjutnya: {next_item}")
                else:
                    print("Tidak ada antrian selanjutnya.")

        # Handle hapus_antrean
        elif pilihan == "4":
            if antrean.is_empty():
                print("Antrian sudah kosong, tidak ada yang bisa dihapus.")
            else:
                selesai = antrean.dequeue()
                print(f"Antrian yang telah selesai: {selesai}")

        # Handle exit_app
        elif pilihan == "5":
            print("Keluar dari program. Sampai jumpa!")
            break

        # Error handling: invalid menu choice
        else:
            print("Pilihan tidak valid. Masukkan angka 1-5.")

        # Tunggu input sembarang untuk lanjut (biar lebih interaktif)
        _ = input("\n> Press any button to continue...")


if __name__ == "__main__":
    main()
