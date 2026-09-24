# INTERVIEW CLIENT

## Konteks dan Latar Belakang

| No. | Pertanyan | Jawaban |
| :---: | ----- | ----- |
| 1\. | Apa masalah utama yang ingin diselesaikan dengan adanya katalog ini? (Misalnya: pelanggan kesulitan melihat produk, katalog masih manual/PDF/Excel, dan sebagainya.) | Real business milik keluarga bernama Citra Production, yang masih menjalankan promosi secara tradisional dari mulut ke mulut, membutuhkan website supaya client dapat melihat katalog  produk, harga, business portofolio.  |
| 2\. | Apa tujuan utama yang ingin dicapai dengan adanya Sistem Katalog Souvenir ini?  | Bisa memiliki website agar client dapat melihat  produk, sebagai business portofolio. |
| 3\. | Bagaimana cara promosi dan penjualan souvenir dilakukan saat ini? | Promosi masih tradisional yaitu komunikasi dari mulut ke mulut. |
| 4\. | Apakah sebelumnya pernah menggunakan sistem atau website serupa? Jika iya, mengapa sistem tersebut sudah tidak digunakan atau dianggap kurang efektif? | Belum Pernah. |
| 5\. | Apakah sistem ini nantinya hanya digunakan sebagai katalog, atau ada kemungkinan dikembangkan untuk proses pemesanan dan transaksi juga?  | Sistem hanya digunakan sebagai katalog. Payment atau transaksi berada di luar scope sistem. |

## Pengguna dan Peran

| No. | Pertanyaan | Jawaban |
| :---: | ----- | ----- |
| 1\. | Siapa saja yang akan menggunakan sistem ini (Misalnya: admin toko, pembeli, mungkin reseller)? | Admin dan Client, sehingga diharapkan sistem memiliki dua sisi pengguna, yaitu admin dan client.  |
| 2\. | Siapa yang bertanggung jawab untuk mengelola dan memperbarui data produk? (admin)? / Apa saja yang perlu dapat dilakukan oleh admin? (Misalnya: menambah, mengubah, menghapus produk, mengelola kategori, stok, dsb.)   | Admin, bertanggung jawab mengelola produk melalui CMS, termasuk menambah, mengubah, menghapus, serta menyembunyikan produk. Admin juga dapat mengelola kategori, portofolio, FAQ, dan informasi footer/kontak.   |
| 3\. | Berapa perkiraan jumlah produk yang akan ditampilkan dalam sistem?  | 15- 20 Produk, Produk memiliki beberapa kategori, seperti samir, medali, plakat, souvenir, pin, serta trofi dan piala.  |

## Kebutuhan Fungsional

| No. | Pertanyaan | Jawaban |
| :---: | ----- | ----- |
| 1\. | Fitur apa saja yang wajib ada di dalam sistem? (Misalnya: kategori souvenir, pencarian, filter harga, detail produk, foto produk)  | Sistem membutuhkan hero section, katalog produk, detail produk, beberapa foto produk dalam bentuk carousel/slider, judul, rentang harga (min-max), deskripsi, jenis pilihan packaging, filter/pencarian produk, portofolio, FAQ, footer, serta CTA yang terhubung ke WhatsApp. |
| 2\. | Apakah sistem perlu menyediakan fitur pemesanan atau transaksi secara langsung, atau cukup digunakan sebagai katalog produk?   | Cukup katalog produk saja, tanpa fitur transaksi. |
| 3\. | Bagaimana alur dari client setelah melihat produk hingga memutuskan untuk melakukan pemesanan (apakah checkout di sistem atau diarahkan ke WA/kontak lain)?  | Client dapat melihat produk melalui website yang telah dibuat, apabila ingin konsultasi lebih lanjut dapat menekan CTA yang terhubung ke WhatsApp. |
| 4 | Bagaimana proses client dalam mencari informasi dan melakukan pemesanan souvenir saat ini, sebelum adanya sistem?   | Client hanya datang langsung ke lokasi maupun bertanya via WhatsApp mengenai produk, mengetahui dari kenalan maupun relasi karena promosinya masih dari mulut ke mulut. |
| 5 | Apa saja yang harus ada atau dapat dilakukan agar sistem ini dianggap sudah memenuhi kebutuhan?   | Sistem harus dapat menampilkan katalog produk dan portofolio dengan informasi yang jelas serta menyediakan CMS agar admin dapat mengelola konten website secara dinamis. FAQ juga harus memiliki proses approval sebelum pertanyaan ditampilkan kepada publik.  |

## Data

| No. | Pertanyaan | Jawaban |
| :---: | ----- | ----- |
| 1\. | Data produk apa saja yang perlu ditampilkan (nama, harga, kategori, stok, deskripsi, foto)? | Data produk meliputi foto, judul, kategori, rentang harga minimum–maksimum, deskripsi, dan jenis packaging. Setiap foto juga perlu memiliki alt text/deskripsi. |
| 2\. | Bagaimana dan di mana data produk saat ini disimpan atau dikelola, misalnya dalam dokumen, spreadsheet, atau media lainnya?  | Untuk data produk ada, nantinya akan dikirimkan data produknya. |
| 3\. | Apakah data produk yang dibutuhkan untuk dimasukkan ke dalam sistem sudah tersedia dan lengkap?  | Sudah tersedia. Nantinya akan dikirimkan data produknya. |
| 4\. | Apakah sistem perlu terintegrasi dengan layanan atau platform lain, seperti WhatsApp, media sosial, sistem penjualan, atau layanan lainnya? Jika iya, bagaimana alurnya? | Tidak membutuhkan integrasi dengan layanan lain. WhatsApp digunakan sebagai media konsultasi melalui CTA, sedangkan Instagram dan TikTok hanya menggunakan placeholder. |

## Kebutuhan Non-Fungsional

| No. | Pertanyaan | Jawaban |
| :---: | ----- | ----- |
| 1\. | Melalui perangkat apa saja sistem akan diakses oleh client dan admin?  | Sistem diakses lewat website, namun ditekankan responsivitasnya di perangkat mobile (disesuaikan dengan mayoritas client menggunakan mobile). |
| 2\. | Bahasa antarmuka yang dibutuhkan apakah hanya Bahasa Indonesia atau juga perlu Bahasa Inggris?  | Bahasa Indonesia saja. |
| 3\. | Apakah sudah tersedia identitas visual seperti logo, warna, font, atau desain tertentu yang harus digunakan? | Logo sudah ada (akan dikirimkan menyusul), untuk warna dll diserahkan kepada tim. |

## Batasan

| No. | Pertanyaan | Jawaban |
| :---: | ----- | ----- |
| 1\. | Berapa lama waktu pengerjaan yang diharapkan? | Sesuai dengan timeline PAD. |
| 2\. | Apakah terdapat teknologi, framework, atau platform tertentu yang diwajibkan untuk digunakan dalam pengembangan sistem?  | Diserahkan kepada tim, namun dipertimbangkan ada menggunakan laravel. |
| 3\. | Siapa yang akan mengelola atau memperbarui sistem setelah selesai dikerjakan (Misalnya: admin toko sendiri atau tetap dibantu tim)? | Admin. |
| 4\. | Apa saja yang harus ada atau dapat dilakukan agar sistem ini dianggap sudah memenuhi kebutuhan? | Sistem harus mampu menyediakan katalog produk dan portofolio yang dapat diakses client serta CMS yang memungkinkan admin mengelola produk, kategori, portofolio, FAQ, dan informasi kontak secara dinamis. |

## Tambahan

| No. | Pertanyaan | Jawaban |
| :---: | ----- | ----- |
| 1\. | Apakah ada budget khusus untuk operasional server dan domain per tahun? Kalau iya, apakah ada preferensi hosting? | Kalau bisa boleh banget, cuman aku minta docker image-nya aja. |

