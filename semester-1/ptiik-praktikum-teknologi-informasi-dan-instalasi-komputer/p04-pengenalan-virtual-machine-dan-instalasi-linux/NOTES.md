# Pertemuan 4: Pengenalan Virtual Machine dan Instalasi Linux

Modul membuka dengan definisi virtual machine sebagai emulasi berbasis perangkat lunak dari komputer fisik yang memungkinkan beberapa sistem operasi berjalan pada satu mesin (hlm. 1). VM dianggap penting karena mendasari konsolidasi server, efisiensi sumber daya, isolasi aplikasi, dan komputasi awan (hlm. 1). Cara kerjanya bergantung pada hypervisor atau Virtual Machine Monitor yang membagi CPU, RAM, dan penyimpanan fisik menjadi bagian virtual untuk setiap VM. Setiap VM diperlakukan sebagai entitas terpisah, sehingga kegagalan pada satu VM tidak menghentikan VM lain, dan lingkungannya aman dipakai untuk menguji perangkat lunak (hlm. 1).

Komponen kunci VM terdiri dari hypervisor, guest OS, dan aplikasi. Hypervisor bertindak sebagai manajer utama yang membuat, mengelola, dan mengisolasi VM serta mengatur alokasi sumber daya. Guest OS adalah sistem operasi di dalam VM, misalnya Windows atau Linux, dan bertanggung jawab mengelola aplikasi serta sumber daya di lingkungan terisolasi itu. Aplikasi di dalam VM berjalan seperti pada komputer fisik, termasuk aplikasi bisnis, server web, dan basis data (hlm. 2-3). Manfaat yang disebutkan meliputi isolasi sumber daya, efisiensi biaya lewat konsolidasi server, kemudahan migrasi, dan skalabilitas tanpa perlu membeli perangkat keras baru (hlm. 3).

Perangkat lunak VM yang populer adalah VMware, VirtualBox, Hyper-V, dan KVM/QEMU (hlm. 4). Modul lalu memilih Oracle VM VirtualBox karena open-source dan menyimulasikan seluruh perangkat keras mesin virtual di atas sistem operasi utama, sehingga berbagai sistem operasi dapat dimiliki tanpa perangkat aslinya (hlm. 4). Instalasi Ubuntu desktop di dalam VM dilakukan dengan mengunduh berkas ISO, membuat VM baru berisi nama, tipe, dan versi sistem operasi, lalu menambahkan ISO tersebut pada optical drive melalui menu Settings dan Storage sebelum menekan Start. Modul menyarankan pemakaian password yang mudah diingat selama proses instalasi berlangsung (hlm. 5-7).

## Poin kunci

- Virtual machine adalah emulasi perangkat lunak dari komputer fisik (hlm. 1).
- Hypervisor membagi sumber daya fisik dan mengisolasi VM satu dari yang lain (hlm. 1-2).
- Komponen VM: hypervisor, guest OS, dan aplikasi (hlm. 2-3).
- Manfaat VM: isolasi sumber daya, efisiensi biaya, kemudahan migrasi, dan skalabilitas (hlm. 3).
- Perangkat lunak VM yang disebut: VMware, VirtualBox, Hyper-V, KVM/QEMU (hlm. 4).
- VirtualBox menyimulasikan perangkat keras, sehingga sistem operasi lain dapat dijalankan tanpa perangkat aslinya (hlm. 4).
- Instalasi Ubuntu di VM memerlukan berkas ISO yang dipasang pada optical drive (hlm. 5-6).

## Istilah

- virtual machine: komputer virtual hasil emulasi perangkat lunak.
- hypervisor: perangkat lunak pengelola dan pengisolasi VM.
- guest OS: sistem operasi yang berjalan di dalam VM.
- host: komputer fisik tempat VM dijalankan.
- konsolidasi server: penggabungan beberapa server ke satu perangkat keras.
- skalabilitas: kemampuan menambah atau mengurangi kapasitas sesuai kebutuhan.
- ISO: berkas citra media instalasi sistem operasi.
- optical drive: perangkat atau slot virtual tempat media instalasi dipasang.

## Sumber

- `pengenalan-virtual-machine-dan-instalasi-linux.local.pdf`, hlm. 1-7
