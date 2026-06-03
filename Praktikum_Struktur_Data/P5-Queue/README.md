Bantu saya mengerjakan praktikum data struktur materi Queue. Soalnya adalah sebagai berikut:

```txt
Sebuah restoran cepat saji membutuhkan sistem untuk mengelola antrean kendaraan di jalur Drive-Thru. Karena keterbatasan lahan, jalur antrean ini hanya bisa menampung maksimal 5 kendaraan dalam satu waktu. Anda diminta untuk membuat program berbasis Queue (Antrean) menggunakan Python untuk menyimulasikan operasional Drive-Thru tersebut dengan prinsip FIFO (First-In, First-Out).

Buatlah sebuah Class DriveThruQueue yang menggunakan struktur data antrean (boleh menggunakan list standar dengan penyesuaian logika, atau collections.deque). Program harus memiliki fitur-fitur wajib berikut:

is_empty() & is_full():
Fungsi untuk mengecek apakah jalur antrean sedang kosong, atau apakah antrean sudah mencapai batas maksimal (5 kendaraan).

tambah_antrean(plat_nomor, pesanan) (Enqueue):
Memasukkan kendaraan baru ke posisi paling belakang antrean.

Kondisi Khusus: Jika antrean sudah penuh (5 kendaraan), program harus menolak input dan mencetak pesan "Mohon maaf, jalur Drive-Thru penuh. Silakan parkir di dalam."

layani_pesanan() (Dequeue):
Memanggil dan mengeluarkan kendaraan yang berada di posisi paling depan untuk memproses pembayarannya.

Kondisi Khusus: Jika antrean kosong, cetak pesan "Tidak ada kendaraan di antrean."

cek_kendaraan_depan() (Peek / Front):
Menampilkan data kendaraan yang berada di urutan pertama (yang akan dilayani selanjutnya) tanpa mengeluarkannya dari antrean.

tampilkan_semua_antrean() (Display):
Menampilkan daftar seluruh kendaraan yang sedang mengantre beserta urutannya, dari depan ke belakang.

```
