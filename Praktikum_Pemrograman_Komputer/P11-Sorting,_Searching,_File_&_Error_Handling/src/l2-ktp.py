with open("ktp_tmp_01.txt", "r") as f:
    lines = f.readlines()
    f.close()

modified: list[str] = []
for line in lines:
    modified.append(line)

    if(line.strip().startswith("STATUS PERKAWINAN")):
        continue

    if(line.strip().startswith("ALAMAT")):
        modified.append("STATUS PERKAWINAN: Menikah dengan Lil Bahlil\n")

with open("ktp_tmp_01.txt", "w") as f:
    lines = f.writelines(modified)
    f.close()
