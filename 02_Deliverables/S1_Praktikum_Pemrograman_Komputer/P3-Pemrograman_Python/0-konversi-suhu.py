# Konversi suhu

# Fahrenheit ke Celcius
def convert_fahrenheit_to_celcius(f = 32):
    c = (f - 32) * 5 / 9
    print(c)

# Celcius ke Fahrenheit
def convert_celcius_to_fahrenheit(c = 0):
    f = c * 9 / 5 + 32
    print(f)

convert_fahrenheit_to_celcius(100)
convert_celcius_to_fahrenheit(100)
