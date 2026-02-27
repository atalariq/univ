# helper functions
def prompt_to_continue():
    input("\nPress any key to continue...")


def clear_screen():
    print("\033c", end="")  # ASCII code untuk membersihkan layar


# main program
class Student:
    def __init__(self, nim, name, origin):
        self.nim = nim
        self.name = name
        self.origin = origin

    def __str__(self):
        return f"{self.nim} | {self.name} | {self.origin}"


def input_data(student_list: list[Student]):
    clear_screen()  # bersihkan layar

    # input data NIM, nama, dan asal daerah
    nim = input("NIM: ")
    name = input("Name: ")
    origin = input("Origin: ")

    student_list.append(Student(nim, name, origin))  # tambahkan data ke list

    print("\nData Saved.")
    prompt_to_continue()


def show_data(student_list: list[Student]):
    clear_screen()  # bersihkan layar
    if not student_list:  # handle jika list utama kosong
        print("No data available.")
    for mhs in student_list:  # iterasi untuk menampilkan setiap data
        print(f"- {mhs}")
    prompt_to_continue()


def main():
    student_list: list[Student] = []

    while True:
        clear_screen()
        print("""
Students Management System
==========================
Action List:
1) Input Data Student
2) Tampilkan Data Student
3) Exit
          """)
        try:
            operator = int(input("Pilih action (1-3): "))
        except ValueError:
            print("\nError: Masukkan harus berupa angka (1-3).")
            prompt_to_continue()
            continue

        match operator:
            case 1:
                input_data(student_list)
            case 2:
                show_data(student_list)
            case 3:
                break
            case _:
                print("Invalid option.")


if __name__ == "__main__":
    main()
