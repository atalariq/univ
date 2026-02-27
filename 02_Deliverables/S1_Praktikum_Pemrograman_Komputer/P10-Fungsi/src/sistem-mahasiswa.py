def _clear_screen() -> None:
    print("\033c", end="")

def _space() -> None:
    print("", end="\n")

def _prompt_to_continue() -> None:
    _space()
    _ = input("Press any key to continue...")

def _header(text: str) -> None:
    print((len(text) + 4)* "=")
    print(text)
    print((len(text) + 4)* "=")

def _encrypt(name: str):
      ROT: int = 3
      cipher = list(name)
      for i in range(len(cipher)):
          c: int = ord(cipher[i])
          if 'a' <= cipher[i] <= 'z':
              c = ord('a') + (c - ord('a') + ROT) % 26
          elif 'A' <= cipher[i] <= 'Z':
              c = ord('A') + (c - ord('A') + ROT) % 26
          cipher[i] = chr(c)
      cipher = "".join(cipher)
      return cipher

class Student:
    def __init__(self, name: str, age: int, avg: float) -> None:
        self.name: str = name
        self.age: int = age
        self.avg: float = avg

    def show(self, encrypted: bool = True) -> None:
        name = _encrypt(self.name) if encrypted else self.name
        print(f"{name} | {self.age} | {self.avg}")

data: list[Student] = []
youngest: Student = Student("_", 999, 0)
oldest: Student = Student("_", 0, 0)

def _append(student: Student):
    global youngest, oldest
    data.append(student)
    if student.age < youngest.age:
        youngest = student
    if student.age > oldest.age:
        oldest = student

# data dummy
_append(Student("Atha", 19, 86))
_append(Student("Barra", 19, 94))
_append(Student("Caca", 19, 98))
_append(Student("Desta", 19, 90))
_append(Student("Erhan", 19, 93))
_append(Student("Fara", 19, 96))
_append(Student("Gamma", 20, 66))
_append(Student("Hanni", 17, 79))
_append(Student("Yanto", 23, 69))

def get_input() -> None:
    _clear_screen()
    _header("Input Mahasiswa Baru")

    name = input("Nama      : ")
    age = int(input("Usia      : "))
    avg = float(input("Rata-rata : "))

    student = Student(name, age, avg)
    _space()
    student.show()

    _append(student)
    _prompt_to_continue()

def show_all_students() -> None:
    _clear_screen()
    _header("Daftar Seluruh Mahasiswa")
    global data
    for student in data:
        student.show()
    _prompt_to_continue()

def find_by_name() -> None:
    _clear_screen()
    _header("Cari Mahasiswa")
    global data
    query = input("Input nama mahasiswa: ")

    _space()

    available = False
    for student in data:
        if query in student.name:
            available = True
            print(f"Usia: {student.age}")
            print(f"Nilai: {student.avg}")

    if (not available):
        print(f"Mohon maaf, mahasiswa a.n. {query} tidak ditemukan!")
    _prompt_to_continue()

def show_all_average_score() -> None:
    _clear_screen()
    _header("Rata-Rata Seluruh Mahasiswa")
    global data
    total: float = 0
    for student in data:
        total += student.avg
    result = total / len(data)
    print(f"Total Keseluruhan     = {total}")
    print(f"Banyak Mahasiswa      = {len(data)}")
    print(f"Rata-rata keseluruhan = {result}")
    _prompt_to_continue()

def show_graduated_students() -> None:
    _clear_screen()
    _header("Daftar Mahasiswa yang Lulus (Rata-rata >= 70)")
    global data

    count = 0
    for student in data:
        if student.avg >= 70:
            student.show()
            count += 1

    _space()
    print(f"Banyak mahasiswa yang lulus: {count}")
    _prompt_to_continue()

def show_youngest_and_oldest() -> None:
    _clear_screen()
    _header("Mahasiswa Termuda dan Tertua")
    global youngest, oldest
    youngest.show()
    oldest.show()
    _prompt_to_continue()

def main():
    while True:
        _clear_screen()
        print('''
Sistem Database Mahasiswa
==========================
Action List:
1) Input Data Mahasiswa
2) Menampilkan Data Mahasiswa
3) Mencari Mahasiswa Berdasarkan Nama Asli
4) Menghitung Rata-Rata Nilai Mahasiswa
5) Menampilkan Mahasiswa yang Lulus
6) Menampilkan Mahasiswa Tertua dan Termuda
7) Exit
        ''')
        operator = int(input("Pilih action (1-7): "))
        match(operator):
            case 1: get_input()
            case 2: show_all_students()
            case 3: find_by_name()
            case 4: show_all_average_score()
            case 5: show_graduated_students()
            case 6: show_youngest_and_oldest()
            case 7: break
            case _: pass

if __name__ == "__main__":
    main()
