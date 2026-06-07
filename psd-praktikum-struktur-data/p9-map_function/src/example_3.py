mahasiswa = [
    {"nama": "Andi Pratama",   "nilai": 88},
    {"nama": "Budi Santoso",   "nilai": 72},
    {"nama": "Citra Dewi",     "nilai": 55},
    {"nama": "Dian Rahayu",    "nilai": 40},
    {"nama": "Eko Wijaya",     "nilai": 95},
    {"nama": "Fina Aulia",     "nilai": 63},
]

def tentukan_grade(mhs):
    nilai = mhs["nilai"]

    if nilai >= 85:
        grade = "A"
    elif nilai >= 75:
        grade = "B"
    elif nilai >= 65:
        grade = "C"
    elif nilai >= 55:
        grade = "D"
    else:
        grade = "E"

    lulus = nilai >= 55
    status = "Lulus" if lulus else "Tidak Lulus"

    return {
        "nama": mhs["nama"],
        "nilai": nilai,
        "grade": grade,
        "status": status,
    }

rekap = list(map(tentukan_grade, mahasiswa))

print(f"{'Nama':<20} {'Nilai':>6} {'Grade':>6} {'Status'}")
print("-" * 46)
for r in rekap:
    print(f"{r['nama']:<20} {r['nilai']:>6} {r['grade']:>6}   {r['status']}")
