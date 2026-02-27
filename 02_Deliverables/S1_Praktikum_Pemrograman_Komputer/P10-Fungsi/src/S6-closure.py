def penghitung():
    n: int = 0
    def counter()->int:
        nonlocal n
        n += 1
        return n
    return counter

counter = penghitung()
print(counter())
print(counter())
print(counter())
