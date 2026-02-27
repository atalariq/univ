pages = int(input())

day = 1
while pages > 0:
    match day:
        case 5:
            pages -= 2
        case 7:
            pages -= 3
        case _:
            pages -= 1

    if pages > 0:
        day += 1
        day %= 7
        # day = day if day <= 7 else 1

# Python >=3.10
match day:
    case 1:
        print("Senin")
    case 2:
        print("Selasa")
    case 3:
        print("Rabu")
    case 4:
        print("Kamis")
    case 5:
        print("Jumat")
    case 6:
        print("Sabtu")
    case 7:
        print("Minggu")

