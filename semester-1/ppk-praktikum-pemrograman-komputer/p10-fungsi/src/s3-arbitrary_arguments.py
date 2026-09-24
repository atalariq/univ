def perkalian(*args: int) -> int:
    hasil = 1
    for arg in args:
        hasil = hasil * arg
    return hasil

hasil: int = perkalian(2, 3, 4)
print(f"Hasil perkalian: {hasil}")
