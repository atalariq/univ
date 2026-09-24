produk = [
    {"nama": "Keyboard Mechanical", "harga": 850000, "diskon": 10},
    {"nama": "Mouse Wireless",      "harga": 320000, "diskon": 15},
    {"nama": "Monitor 27 inch",     "harga": 3200000, "diskon": 5},
    {"nama": "USB Hub",             "harga": 150000, "diskon": 20},
    {"nama": "Webcam HD",           "harga": 480000, "diskon": 0},
]

THRESHOLD = 500000

def hitung_harga_akhir(p):
    harga_akhir = p["harga"] * (1 - p["diskon"] / 100)
    kategori = "Terjangkau" if harga_akhir <= THRESHOLD else "Mahal"
    return {
        "nama": p["nama"],
        "harga_asli": p["harga"],
        "diskon": f"{p['diskon']}%",
        "harga_akhir": round(harga_akhir),
        "kategori": kategori,
    }

hasil = list(map(hitung_harga_akhir, produk))

for item in hasil:
    print(f"[{item['kategori']:^10}] {item['nama']:<22} "
          f"Rp{item['harga_asli']:>9,} -> Rp{item['harga_akhir']:>9,} ({item['diskon']} off)")
