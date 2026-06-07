# Helper Function =========================================

def _clear_screen() -> None:
    print("\033c", end="")

def _prompt_to_continue() -> None:
    _ = input("Press any key to continue...")

def _header(text: str) -> None:
    print((len(text) + 4)* "=")
    print(text)
    print((len(text) + 4)* "=")
    print()

# =========================================================

import os

DIR = "./DATA-KTP"

try:
    os.mkdir(DIR)
except FileExistsError:
    pass

def _list_ktp():
    print("Daftar KTP tersimpan:")
    files = os.listdir(DIR)
    if not files:
        print("[Kosong... Tidak ada data ktp yang tersimpan]")
    else:
        for f in files:
            print(f"- {f}")
    print()

def add_ktp():
    _clear_screen()
    _header("Input Data KTP Baru")

    nama = input("Nama: ")

    file_content = f'''
NIK: {input("NIK: ")}
NAMA: {nama}
TEMPAT/TGL LAHIR: {input("Tempat, Tanggal Lahir: ")}
ALAMAT: {input("Alamat: ")}
STATUS PERKAWINAN: {input("Status Perkawinan: ")}
PEKERJAAN: {input("Pekerjaan: ")}
    '''

    file = f"{DIR}/{nama.lower().replace(' ', '_')}.txt"
    with open(file, "w") as f:
        _ = f.write(file_content)
        f.close()

    _prompt_to_continue()

def read_ktp():
    _clear_screen()
    _header("Baca Data KTP")
    _list_ktp()

    try:
        nama_file = input('File ktp (tanpa ekstensi .txt): ')
        file = f"{DIR}/{nama_file}.txt"
        
        with open(file, "r") as f:
            print("\n--- Isi File ---")
            print(f.read())
            print("----------------")
    except FileNotFoundError:
        print(f"\nError: File '{nama_file}.txt' tidak ditemukan.")
    except Exception as e:
        print(f"\nTerjadi error: {e}")

    _prompt_to_continue()

def delete_ktp():
    _clear_screen()
    _header("Hapus KTP")
    _list_ktp()

    try:
        nama_file = input('File ktp (tanpa ekstensi .txt): ')
        file = f"{DIR}/{nama_file}.txt"

        os.remove(file)
        print(f"\nFile '{nama_file}.txt' berhasil dihapus.")
    except FileNotFoundError:
        print(f"\nError: File '{nama_file}.txt' tidak ditemukan.")
    except Exception as e:
        print(f"\nTerjadi error lain: {e}")

    _prompt_to_continue()

def main():
    while True:
        _clear_screen()
        print('''
KTP Management System
==========================
Action List:
1) Tambah/Update Data KTP
2) Baca Data KTP
3) Hapus Data KTP
4) Exit
        ''')

        try:
            operator = int(input("Pilih action (1-4): "))
            match(operator):
                case 1: add_ktp()
                case 2: read_ktp()
                case 3: delete_ktp()
                case 4: break
                case _:
                    print("\nError: Pilihan tidak valid.")
                    _prompt_to_continue()
        except ValueError:
            print("\nError: Masukkan harus berupa angka (1-4).")
            _prompt_to_continue()


if __name__ == "__main__":
    main()
