# Uploaded on: https://gist.github.com/atalariq/bb443e962d44cc18de9d3f5b822abbb2

# Soal 1: Faktorial pakai For Loop
def fac(n):
    res = 1
    for k in range(1, n + 1):
        res *= k
    return res


# Soal 2: Even Or Odd
def pos_neg(n):
    res = 0
    if n < 0:
        return 0
    else:
        while n > 0:
            res += n % 10
            n //= 10
    return res


# Soal 3: Custom Fibonacci
def new_fib(n, a, b):
    fib = [a, b]
    for i in range(n - 2):
        fib.append(fib[i] + fib[i + 1])
    return fib


# Soal 4: Gaji Karyawan
def count_salary(name, type, work_hour):
    salary_per_hour = 0
    if type == "A":
        salary_per_hour = 4000
    elif type == "B":
        salary_per_hour = 5000
    elif type == "C":
        salary_per_hour = 6000
    elif type == "D":
        salary_per_hour = 7000

    overtime_hour = work_hour - 48 if (work_hour > 48) else 0
    salary = (
        48 * salary_per_hour + overtime_hour * 3000
        if (overtime_hour > 0)
        else work_hour * salary_per_hour
    )

    return name, salary


def main():
    print("============Soal 1=============")
    for i in range(1, 5):
        print(f"Factorial of {i}: {fac(i)}")

    print("============Soal 2=============")
    for i in [-10, 0, 123, 149, 666, 777]:
        print(f"{i}: {pos_neg(i)}")

    print("============Soal 3=============")
    fib = new_fib(8, 1, 1)
    for n in fib:
        print(n, end=" ")
    print()

    fib = new_fib(10, 2, 3)
    for n in fib:
        print(n, end=" ")
    print()

    fib = new_fib(5, 12, 13)
    for n in fib:
        print(n, end=" ")
    print()

    print("============Soal 4=============")
    name, salary = count_salary("Anis", "A", 72)
    print(f"Gaji {name} sebesar {salary}")

    name, salary = count_salary("Budi", "D", 64)
    print(f"Gaji {name} sebesar {salary}")


if __name__ == "__main__":
    main()
