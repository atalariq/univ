def konversi_suhu(celsius):
    fahrenheit = (celsius * 9 / 5) + 32
    kelvin = celsius + 273.15
    return (celsius, round(fahrenheit, 2), round(kelvin, 2))

data_celsius = [0, 25, 37, 100, -40]

hasil = list(map(konversi_suhu, data_celsius))

print(f"{'Celsius':>10} {'Fahrenheit':>12} {'Kelvin':>10}")
print("-" * 36)
for c, f, k in hasil:
    print(f"{c:>10} {f:>12} {k:>10}")
