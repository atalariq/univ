def faktorial(n: int) -> int:
    if 0 <= n <= 1:
        return 1
    return n * faktorial(n-1)

n: int = 5
hasil: int = faktorial(n)
print(f"Hasil faktorial dari {n} adalah: {hasil}")
