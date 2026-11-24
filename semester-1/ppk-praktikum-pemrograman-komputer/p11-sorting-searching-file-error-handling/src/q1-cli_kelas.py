# Helper Function =========================================
def _clear_screen() -> None:
    print("\033c", end="")

def _prompt_to_continue() -> None:
    _ = input("\nPress any key to continue...")

def _header(text: str) -> None:
    print((len(text) + 4)* "=")
    print(text)
    print((len(text) + 4)* "=")
    print()

# =========================================================

class Student:
    def __init__(self, nama: str, nilai_1: int, nilai_2: int):
        self.nama: str = nama
        self.nilai_1: int = nilai_1
        self.nilai_2: int = nilai_2
        self.rataan: int = (nilai_1 + nilai_2) // 2

    def __str__(self):
        return f"{self.nama} | {self.nilai_1} | {self.nilai_2} | {self.rataan}"

data: list[Student] = []
isSorted = False

def add_data():
    _clear_screen()
    _header("Input Data Baru")

    global isSorted
    isSorted = False

    try:
        nama = input("Nama: ")
        # Tambahan: Memastikan nama tidak kosong
        if not nama:
            raise ValueError("Nama tidak boleh kosong.")

        nilai_1 = int(input("Nilai 1: "))
        nilai_2 = int(input("Nilai 2: "))

        student = Student(nama, nilai_1, nilai_2)
        data.append(student)
        print(student)

    except ValueError as e: # 'e' akan berisi pesan errornya
        print(f"\nError: Input tidak valid. ({e})")
        print("Pastikan nilai adalah angka dan nama tidak kosong.")

    _prompt_to_continue()

def sort_avg():
    _clear_screen()
    _header("Sort By Average")

    global isSorted
    isSorted = True

    data.sort(key=lambda student: student.rataan)
    for student in data:
        print(student)

    _prompt_to_continue()

def find_by_avg():
    _clear_screen()
    _header("Find By Average")

    # 1. Menangani list kosong
    if not data:
        print("Data masih kosong. Silakan input data terlebih dahulu.")
        _prompt_to_continue()
        return

    global isSorted
    if not isSorted:
        print("Data belum terurut. Mengurutkan data terlebih dahulu...")
        sort_avg() # Panggil sort secara otomatis
        return

    # 2. Menangani input non-angka
    try:
        query = int(input("Query: "))
    except ValueError:
        print("\nError: Rata-rata yang dicari harus berupa angka.")
        _prompt_to_continue()
        return

    found = False
    low = 0
    high = len(data) - 1

    while(low <= high):
        mid = (high + low ) // 2

        if data[mid].rataan == query:
            found = True
            print(data[mid])

            # 1. Cek ke kiri dari 'mid'
            i = mid - 1
            while i >= 0 and data[i].rataan == query:
                print(data[i])
                i -= 1

            # 2. Cek ke kanan dari 'mid'
            i = mid + 1
            while i < len(data) and data[i].rataan == query:
                print(data[i])
                i += 1
            break
        elif data[mid].rataan < query:
            low = mid + 1
        else:
            high = mid - 1

    # Kalau data tidak ditemukan
    if not found:
        print("Hasil tidak ditemukan")

    _prompt_to_continue()

def main():
    while True:
        _clear_screen()
        print('''
Class Management System
==========================
Action List:
1) Input Data Mahasiswa
2) Urutkan Rata-Rata
3) Cari Berdasarkan Rata-Rata
4) Exit
        ''')
        try:
            operator = int(input("Pilih action (1-4): "))
        except ValueError:
            print("\nError: Masukkan harus berupa angka (1-4).")
            _prompt_to_continue()
            continue

        match(operator):
            case 1: add_data()
            case 2: sort_avg()
            case 3: find_by_avg()
            case 4: break
            case _: pass

if __name__ == "__main__":
    main()
