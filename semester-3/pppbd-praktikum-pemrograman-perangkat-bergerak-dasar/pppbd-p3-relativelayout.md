# PPPBD - Pertemuan 3

## Logs

1. Bikin project baru di Android Studio (Empty Views)
2. Upload di GitHub dulu
3. Lakukan langkah-langkah yang ada di module (copas aje!)
4. Iterasi + Commit & Push ke GitHub...

## Error and Troubleshooting

- Clip Art not showing all icons (FIle > New > Vector Asset)
  <https://stackoverflow.com/questions/64382564/how-i-fix-nothing-to-show-in-my-vector-asset-in-android-studio>
  TLDR: Solusinya:
  1. Hapus file `<sdk>/icons/materials/icons_metadata.txt` dan coba buka lagi
     `rm -v ~/Library/Android/sdk/icons/material/icons_metadata.txt `
  2. Buat file `<sdk>/icons/materials/icons_metadata.txt` jadi read-only!
  3. Tunggu aja dan buka Icon Selector secara berkala...
     Sebenarnya penyebab icons nggak tampil semua itu karena emang belum ke-download aja
