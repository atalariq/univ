# print bilangan kuadrat dari suatu list bilangan bulat

angka: list[int] = [1, 2, 3, 4, 5]
hasil: list[int]  = list(map(lambda x: x ** 2, angka))

print(f"Hasil kuadrat dari {angka}: {hasil}")
