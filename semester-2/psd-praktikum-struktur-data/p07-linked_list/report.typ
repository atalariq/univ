#import "@atalariq/lab-report:1.0.0": *
#import "@atalariq/code:1.0.0": *

#let metadata = (
  author: "Atalariq Barra Hadinugraha",
  id: "25/557554/SV/26192",
  class: "B2",
  course: "Praktikum Struktur Data",
  course-code: "PSD",
  lecturer: "Firma Syahrian, S.Kom., M.Cs.",
  meeting: "7",
  title: "Implementasi Linked List pada Aplikasi Daftar Kontak",
)

#show: report.with(
  ..metadata,
  use-cover: false,
  bib: none,
  font: "Times New Roman",
  code-font: "Fira Code",
  font-size: 12pt,
)

// Simple header
#align(center)[
  #text(1.25em, weight: "bold")[
    Tugas #metadata.course \
    #metadata.title
  ]

  #text(0.8em)[
    #metadata.author (#metadata.id)
  ]
]
#line(length: 100%)

#set par(justify: true)
#set par(first-line-indent: (amount: 0.5in, all: true))
#set heading(numbering: "1.")
#set enum(numbering: "a.1.")

#let include-code(path, ..args) = code-from-file(read(path), lang: path.split(".").at(-1), ..args)
#let img(path, ..args) = image-wrapper(read(path, encoding: none), ..args)

= Hasil Analisis

Linked List merupakan struktur data yang tepat untuk menyimpan daftar kontak pada aplikasi smartphone karena karakteristiknya yang sesuai dengan pola penggunaan nyata. Daftar kontak bersifat dinamis, kontak dapat ditambahkan dan dihapus kapan saja tanpa batas yang ditetapkan di awal. Array statis tidak memadai untuk kasus ini karena ukurannya harus ditentukan di muka, sedangkan `list` Python yang berbasis array dinamis harus mengalokasikan ulang seluruh blok memori setiap kali kapasitas habis.

Linked List menghindari masalah tersebut karena sifatnya yang *non-contagious* dengan mengalokasikan setiap node secara terpisah, tidak harus selalu berurutan (sequential). Penambahan kontak baru hanya membutuhkan pembuatan satu node baru dan pembaruan satu pointer -- tidak ada elemen lain yang disentuh. Pada implementasi ini, pointer `tail` dilacak secara eksplisit sehingga operasi `add_contact` selalu berjalan dalam waktu $O(1)$, tanpa perlu menelusuri seluruh list untuk menemukan posisi akhir.

Penghapusan kontak berdasarkan nama secara inheren memerlukan pencarian linier $O(n)$ karena data tidak terurut berdasarkan indeks numerik. Namun, begitu node target ditemukan, penghapusannya sendiri hanya memerlukan pembaruan satu pointer (`prev.next = cur.next`). Sehingga, tidak ada pergeseran elemen seperti yang terjadi pada penghapusan di tengah array.


#img("assets/big-o.png", caption: [Perbandingan notasi Big-O untuk operasi struktur data umum])

Satu keterbatasan yang perlu dicatat dalam implementasi Linked List yaitu tidak mendukung akses acak $O(1)$. Menampilkan kontak ke-$k$ memerlukan traversal dari head, berbeda dengan array yang dapat mengakses elemen mana pun secara langsung melalui indeks. Namun, untuk kasus aplikasi daftar kontak, di mana operasi yang dominan adalah penambahan dan penghapusan; keterbatasan ini tidak signifikan dalam praktiknya.

= Implementasi

== Kode Program dan Penjelasan

Kelas `Contact` merepresentasikan data satu entri kontak. Method `__str__` mendefinisikan format tampilan yang digunakan saat kontak dicetak:

#code(```py
class Contact:
    def __init__(self, name, phone, email):
        self.name = name
        self.phone = phone
        self.email = email

    def __str__(self):
        return f"Nama: {self.name} | Telp: {self.phone} | Email: {self.email}"
```)

Kelas `Node` membungkus satu objek `Contact` dan menyimpan referensi ke node berikutnya. Nilai default `None` pada kedua parameter memungkinkan pembuatan dummy head node tanpa data:

#code(```py
class Node:
    def __init__(self, contact=None, next=None):
        self.contact = contact
        self.next = next
```)

Kelas `ContactLinkedList` mengelola keseluruhan list. Inisialisasi membuat dummy head node (`self.root`) yang tidak menyimpan data kontak. `self.tail` diinisialisasi menunjuk ke `self.root` karena list masih kosong:

#code(```py
class ContactLinkedList:
    def __init__(self):
        self.root = Node()  # Dummy head
        self.tail = self.root
```)

Fungsi `add_contact` membuat node baru dan menyambungkannya ke ujung list melalui `self.tail`. Karena pointer tail selalu diperbarui, operasi ini tidak memerlukan traversal -- kompleksitasnya $O(1)$:

#code(```py
    def add_contact(self, name, phone, email):
        new_contact = Contact(name, phone, email)
        new_node = Node(new_contact)

        # Penambahan selalu O(1) karena kita melacak tail
        self.tail.next = new_node
        self.tail = new_node
        print(f"Sukses menambahkan kontak: {name}")
```)

Fungsi `display_contacts` menelusuri list dari `self.root.next` (node pertama berisi data, melewati dummy head) hingga `None`. Pengecekan list kosong dilakukan di awal untuk menghindari eksekusi blok tampilan yang tidak perlu:

#code(```py
    def display_contacts(self):
        cur = self.root.next
        if not cur:
            print("Daftar kontak masih kosong.")
            return

        print("\n--- Daftar Kontak ---")
        while cur:
            print(cur.contact)
            cur = cur.next
        print("---------------------\n")
```)

Fungsi `remove_by_name` menggunakan teknik _two-pointer_ dengan `prev` dan `cur` untuk menghapus node target tanpa kehilangan referensi ke node sebelumnya. Perbandingan nama dilakukan secara case-insensitive menggunakan `.lower()`. Setelah node ditemukan dan dihapus (`prev.next = cur.next`), kondisi khusus dicek: jika node yang dihapus adalah `tail`, maka `self.tail` diperbarui ke `prev` untuk menjaga konsistensi pointer tail:

#code(```py
    def remove_by_name(self, name):
        cur = self.root.next
        prev = self.root

        while cur:
            # Membandingkan nama dengan mengabaikan huruf besar/kecil
            if cur.contact.name.lower() == name.lower():
                prev.next = cur.next
                # Perbarui tail jika elemen terakhir yang dihapus
                if cur == self.tail:
                    self.tail = prev
                print(f"Kontak '{name}' berhasil dihapus.")
                return True
            prev = cur
            cur = cur.next

        print(f"Gagal: Kontak '{name}' tidak ditemukan.")
        return False
```)

Blok `__main__` mendemonstrasikan penggunaan ketiga fungsi: menambahkan dua
kontak, menampilkan seluruh list, menghapus satu kontak berdasarkan nama, lalu
menampilkan kembali untuk memverifikasi hasil penghapusan:

#code(```py
if __name__ == "__main__":
    my_contacts = ContactLinkedList()

    my_contacts.add_contact("Alice", "0812345", "alice@email.com")
    my_contacts.add_contact("Bob", "0898765", "bob@email.com")

    my_contacts.display_contacts()

    my_contacts.remove_by_name("alice")
    my_contacts.display_contacts()
```)

== Output

// TODO: apply real image
#img("assets/output.png", caption: [Hasil output program `contact_app.py`])

#pagebreak()

= Lampiran

== Kode Lengkap

#code(header: [contact_app.py],
```py
class Contact:
    def __init__(self, name, phone, email):
        self.name = name
        self.phone = phone
        self.email = email

    def __str__(self):
        return f"Nama: {self.name} | Telp: {self.phone} | Email: {self.email}"

class Node:
    def __init__(self, contact=None, next=None):
        self.contact = contact
        self.next = next

class ContactLinkedList:
    def __init__(self):
        self.root = Node()  # Dummy head
        self.tail = self.root

    def add_contact(self, name, phone, email):
        new_contact = Contact(name, phone, email)
        new_node = Node(new_contact)

        # Penambahan selalu O(1) karena kita melacak tail
        self.tail.next = new_node
        self.tail = new_node
        print(f"Sukses menambahkan kontak: {name}")

    def display_contacts(self):
        cur = self.root.next
        if not cur:
            print("Daftar kontak masih kosong.")
            return

        print("\n--- Daftar Kontak ---")
        while cur:
            print(cur.contact)
            cur = cur.next
        print("---------------------\n")

    def remove_by_name(self, name):
        cur = self.root.next
        prev = self.root

        while cur:
            # Membandingkan nama dengan mengabaikan huruf besar/kecil
            if cur.contact.name.lower() == name.lower():
                prev.next = cur.next
                # Perbarui tail jika elemen terakhir yang dihapus
                if cur == self.tail:
                    self.tail = prev
                print(f"Kontak '{name}' berhasil dihapus.")
                return True
            prev = cur
            cur = cur.next

        print(f"Gagal: Kontak '{name}' tidak ditemukan.")
        return False

if __name__ == "__main__":
    my_contacts = ContactLinkedList()

    my_contacts.add_contact("Alice", "0812345", "alice@email.com")
    my_contacts.add_contact("Bob", "0898765", "bob@email.com")

    my_contacts.display_contacts()

    my_contacts.remove_by_name("alice")
    my_contacts.display_contacts()
```)
