# Pertemuan 6: Normalization

Normalization didefinisikan sebagai proses menguraikan relation yang kurang baik dengan memecah attribute-nya menjadi relation yang lebih kecil (hlm. 20). Tujuannya mengurangi redundansi dan menghilangkan anomaly. Deck kedua merumuskannya sebagai proses menempatkan attribute pada entity yang tepat, melalui serangkaian tahap yang disebut normal form: 1NF, 2NF, 3NF, dan 4NF, dengan catatan bahwa normalisasi tertinggi tidak selalu diinginkan (hlm. 2).

Materi lebih dulu memberi pedoman perancangan. Setiap tuple sebaiknya mewakili satu entity atau satu instance relationship, foreign key saja yang dipakai untuk merujuk entity lain, attribute entity dan relationship dijaga terpisah, dan skema harus dapat dijelaskan relation demi relation (hlm. 3). Ketika attribute dari beberapa entity dicampur, muncul redundansi dan tiga jenis anomaly: insertion, deletion, dan modification (hlm. 6). Contohnya relation EMP_PROJ berisi Emp#, Proj#, Ename, Pname, dan No_hours; mengganti nama proyek P1 harus diulang pada semua baris karyawan yang mengerjakannya, proyek tidak bisa disisipkan tanpa karyawan, dan menghapus proyek bisa ikut menghapus data karyawan (hlm. 9-10). Materi juga menyarankan agar tuple memuat sedikit mungkin NULL (hlm. 11) dan agar hasil join tidak memunculkan spurious tuple, yaitu syarat lossless join (hlm. 12).

Alat formalnya adalah functional dependency. X → Y berlaku bila setiap kali dua tuple memiliki nilai X yang sama, nilai Y keduanya juga sama (hlm. 15). Contohnya SSN → ENAME, PNUMBER → {PNAME, PLOCATION}, dan {SSN, PNUMBER} → HOURS (hlm. 16). Jika K adalah key, maka K menentukan seluruh attribute pada relation (hlm. 17). Dari sekumpulan FD dapat diturunkan FD lain memakai tiga aturan Armstrong: reflexive, augmentation, dan transitive, yang disebut sound dan lengkap (hlm. 18). Aturan turunan yang berguna mencakup decomposition, union, dan pseudotransitivity, sedangkan closure F+ adalah himpunan semua FD yang dapat diturunkan dari F (hlm. 19).

First normal form melarang attribute composite, multivalued, dan relation bersarang, sehingga semua nilai harus atomik (hlm. 21). Second normal form menuntut setiap attribute non-prime bergantung penuh pada primary key, sehingga partial dependency tidak boleh ada (hlm. 24-25). Third normal form menambahkan syarat tidak ada ketergantungan transitif dari attribute non-prime terhadap primary key (hlm. 28-29). Boyce-Codd normal form lebih ketat: setiap FD X → A mengharuskan X menjadi superkey (hlm. 30). Setiap normal form lebih kuat dari sebelumnya, dan ada relation yang berada di 3NF tetapi tidak di BCNF, seperti contoh {Student, course} → Instructor bersama Instructor → Course (hlm. 30, 33).

Deck kedua menelusuri kasus perusahaan konstruksi secara bertahap. Tabel laporan awal memuat repeating group dan NULL pada kolom yang seharusnya menjadi primary key (hlm. 6-7). Konversi ke 1NF dilakukan dengan menambahkan entri pada kolom key (hlm. 7), lalu ke 2NF dengan memisahkan setiap komponen key menjadi tabel sendiri, menghasilkan PROJECT, EMPLOYEE, dan ASSIGN (hlm. 11). Konversi ke 3NF memisahkan attribute yang bergantung transitif, sehingga muncul tabel JOB untuk JOB_CLASS dan CHG_HOUR (hlm. 14). BCNF didefinisikan sebagai syarat bahwa setiap determinant adalah candidate key, dan bila tabel hanya punya satu candidate key maka 3NF dan BCNF setara (hlm. 17, 22).

## Poin kunci

- Normalisasi mengurangi redundansi dan menghilangkan anomaly insertion, deletion, dan modification (hlm. 2, 6).
- Functional dependency X → Y berarti nilai X menentukan nilai Y (hlm. 15).
- Tiga aturan Armstrong adalah reflexive, augmentation, dan transitive (hlm. 18).
- 1NF menuntut semua nilai attribute atomik (hlm. 21).
- 2NF melarang partial dependency pada primary key (hlm. 25).
- 3NF melarang ketergantungan transitif attribute non-prime (hlm. 29).
- BCNF menuntut setiap determinant menjadi candidate key, dan 3NF yang hanya punya satu candidate key sudah BCNF (hlm. 17, 30).

## Istilah

- normalization: proses menguraikan relation menjadi relation yang lebih kecil dan sehat.
- normal form: kondisi yang menyatakan tingkat kesehatan suatu skema.
- redundansi: penyimpanan data yang sama berulang kali.
- insertion, deletion, modification anomaly: gangguan yang muncul akibat skema yang buruk.
- functional dependency: keterkaitan nilai antar attribute.
- partial dependency: ketergantungan pada sebagian primary key saja.
- transitive dependency: ketergantungan attribute non-prime pada attribute non-prime lain.
- prime attribute: attribute yang menjadi anggota primary key.
- determinant: attribute yang nilainya menentukan attribute lain.
- candidate key: attribute atau kumpulan attribute yang dapat menjadi primary key.
- Armstrong's inference rules: aturan penurunan FD.
- closure F+: himpunan semua FD yang dapat diturunkan dari F.
- lossless join: sifat join yang tidak memunculkan tuple palsu.
- spurious tuple: tuple salah yang muncul akibat join pada skema yang buruk.

## Sumber

- `normalization.local.pdf`, hlm. 2-12 (pedoman desain dan anomaly)
- `normalization.local.pdf`, hlm. 14-19 (functional dependency dan aturan Armstrong)
- `normalization.local.pdf`, hlm. 20-34 (1NF sampai BCNF)
- `normalize.local.pdf`, hlm. 2-15 (kasus perusahaan konstruksi dan konversi 1NF-3NF)
- `normalize.local.pdf`, hlm. 17-22 (BCNF)
