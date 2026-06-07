def hitung_frekuensi(teks):
    frekuensi = {}
    teks = teks.lower().split()

    for kata in teks:
        kata_bersih = kata.strip(".,!?;:\"'`()[]{}")
        if not kata_bersih:
            continue

        if kata_bersih in frekuensi:
            frekuensi[kata_bersih] += 1
        else:
            frekuensi[kata_bersih] = 1

    return frekuensi


def tampilkan_frekuensi(frekuensi: dict) -> None:
    print("-" * 40)
    print(f"{'Kata':<20} {'Frekuensi':>10}")
    print("-" * 40)

    for kata in sorted(frekuensi.keys()):
        print(f"{kata:<20} {frekuensi[kata]:>10}")
    print("-" * 40)

    print(f"Total kata unik: {len(frekuensi)}")


if __name__ == "__main__":
    contoh_teks = (
        "hash table hash table hash "
        "table hash python python python "
        "data struktur data hash"
    )

    hasil = hitung_frekuensi(contoh_teks)
    tampilkan_frekuensi(hasil)
