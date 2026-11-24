# Pertemuan 8: Clonezilla

Bab ini berada di bawah judul perawatan dan perbaikan komputer, dengan tujuan agar mahasiswa mampu melakukan perawatan, perbaikan, pengkloningan hard disk, dan pemasangan antivirus (hlm. 1). Bagian pertama membahas pertimbangan memilih komponen dan sistem operasi. Harga disesuaikan dengan kebutuhan pemakaian, misalnya PC bekas untuk kerja office dan prosesor terbaru untuk pekerjaan grafis, game, atau penyuntingan video. Pemilihan power supply dan monitor disesuaikan dengan daya listrik yang tersedia, dan monitor LCD disebut lebih hemat daya (hlm. 1). Sistem operasi dipilih menurut kapasitas RAM: di bawah 1 GB untuk Windows XP dan di atas 1 GB untuk Windows 7, sedangkan Linux tidak bergantung pada RAM karena memiliki partisi SWAP meski disarankan minimal 64 MB (hlm. 1).

Inti bab ini adalah kloning hard disk dengan Clonezilla. Persiapan mencakup CD Clonezilla, hard disk master yang sudah berisi sistem operasi siap pakai, dan hard disk target yang kosong, dengan syarat kapasitas master harus lebih kecil daripada target. Semua dirangkai dalam satu PC, lalu komputer dibooting dari CD (hlm. 2). Alur di Clonezilla adalah memilih bahasa, memilih Don't touch keymap, memilih Start Clonezilla, memilih mode Device-Device, lalu memilih Disk-To-LocalDisk. Hard disk master dipilih berdasarkan kapasitas atau nama partisinya, kemudian hard disk target dipilih, pengecekan dilewati dengan Skip Checking, dan konfirmasi Y/N dijawab beberapa kali sampai proses selesai. Komputer dimatikan dengan menekan 0 (hlm. 2-3).

Sebagai pembanding, modul juga mencatat kloning dengan Norton Ghost: instal aplikasi, buat disket boot lewat Norton Ghost Boot Wizard, atur posisi jumper hard disk master sebagai primary master dan target sebagai secondary master, ubah boot sequence ke floppy drive, lalu pilih Local, Disk, to Disk. Setelah sistem operasi dan aplikasinya terpasang, komputer perlu diproteksi dengan antivirus yang diperbarui berkala (hlm. 4-7). Bagian terakhir membahas optimalisasi Windows XP melalui System Properties: memilih Adjust for best performance pada Visual Effects, mematikan Automatic Updates, dan mematikan System Restore, dengan saran memutus koneksi jaringan saat instalasi (hlm. 9).

## Poin kunci

- Kapasitas hard disk master harus lebih kecil daripada hard disk target (hlm. 2).
- Clonezilla dijalankan dari CD dan memakai mode Device-Device lalu Disk-To-LocalDisk (hlm. 2-3).
- Pengecekan dilewati dengan Skip Checking dan konfirmasi Y/N muncul beberapa kali (hlm. 3).
- Norton Ghost memakai disket boot dan pengaturan jumper primary serta secondary master (hlm. 4-5).
- Linux memakai partisi SWAP sehingga tidak bergantung pada kapasitas RAM (hlm. 1).
- Antivirus dipasang setelah sistem operasi dan aplikasi selesai, lalu diperbarui berkala (hlm. 7).
- Optimalisasi Windows XP dilakukan lewat Visual Effects, Automatic Updates, dan System Restore (hlm. 9).

## Istilah

- kloning: penyalinan isi hard disk sehingga hasilnya sama dengan sumbernya.
- hard disk master: disk sumber yang sudah berisi sistem operasi.
- hard disk target: disk kosong tujuan hasil kloning.
- SWAP: partisi Linux yang dipakai sebagai tambahan memori.
- jumper: pin pengatur posisi perangkat pada kanal IDE.
- boot sequence: urutan perangkat yang dicoba saat booting.
- System Restore: fitur Windows untuk mengembalikan kondisi sistem.
- Visual Effects: pengaturan efek tampilan Windows.

## Sumber

- `perawatan-dan-perbaikan-komputer-clonezilla.local.pdf`, hlm. 1-9
