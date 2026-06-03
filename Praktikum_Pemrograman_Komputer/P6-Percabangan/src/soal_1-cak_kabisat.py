tahun: int = int(input("Masukkan tahun: "))
if tahun % 4 == 0:
    if tahun % 100 != 0 or tahun % 400 == 0:
        print(f"{tahun} adalah tahun kabisat")
    else:
        print(f"{tahun} bukan tahun kabisat")
else:
    print(f"{tahun} bukan tahun kabisat")
