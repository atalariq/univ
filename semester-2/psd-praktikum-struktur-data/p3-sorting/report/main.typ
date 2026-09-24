#import "./template.typ": *
#import "@preview/numbly:0.1.0": numbly

#show: report.with(
  author: "Atalariq Barra Hadinugraha",
  id: "25/557554/SV/26192",
  class: "B2",
  course: "Praktikum Struktur Data",
  course-code: "PSD",
  lecturer: "Firma Syahrian, S.Kom., M.Cs.",
  meeting: "3",
  title: "Sorting",

  minimal: true,
  show-table-of-content: false,
  show-table-of-figure: false,
  show-table-of-table: false,
  show-bibliography: false,

  paper: "a4",
  font: "Times New Roman",
  font-size: 12pt,
  lang: "id",
)

#set heading(numbering: numbly("{1}.", "{2}.", "{2}.{3}", "{2}.{3}.{4}"))


= Deskripsi Soal

Diberikan list data sebagai berikut:

#eq(
  $[5, 3, 28, 15, 0, 35, 2]$,
)

Buatlah program Python untuk mengurutkan data tersebut menggunakan tiga algoritma sorting yang telah dipelajari, yaitu:
1. Bubble Sort
2. Selection Sort
3. Insertion Sort

Setiap algoritma perlu dijelaskan langkah-langkahnya secara rinci.


= Kode Program

#code(
  ```py
def selection_sort(arr):
    for i in range(len(arr)):
        min_id = i
        for j in range(i+1, len(arr)):
            if arr[j] < arr[min_id]:
                min_id = j
        arr[min_id], arr[i] = arr[i], arr[min_id]
    return arr

def insertion_sort(arr):
    for i in range(1, len(arr)):
        key_item = arr[i]
        j = i - 1
        while j >= 0 and arr[j] > key_item:
            arr[j+1] = arr[j]
            j -= 1
        arr[j+1] = key_item
    return arr

def bubble_sort(arr):
    for i in range(len(arr)):
        for j in range(len(arr) - i - 1):
            if arr[j] > arr[j+1]:
                arr[j], arr[j+1] = arr[j+1], arr[j]
    return arr

def main():
    arr = [5, 3, 28, 15, 0, 35, 2]
    print(selection_sort(arr[:]))
    print(insertion_sort(arr[:]))
    print(bubble_sort(arr[:]))

if __name__ == "__main__":
    main()
  ```
)


= Hasil dan Pembahasan

== Selection Sort

Selection Sort bekerja dengan mencari elemen terkecil dari bagian yang belum terurut, lalu menukarnya dengan elemen pertama dari bagian tersebut. Proses ini diulang untuk setiap posisi dalam array.

#grid(
  columns: (1fr, 1fr),
  img("assets/selection_sort_1.svg", width: 6cm),
  img("assets/selection_sort_2.svg", width: 6cm)
)

#grid(
  columns: (1fr, 1fr),
  img("assets/selection_sort_3.svg", width: 6cm),
  img("assets/selection_sort_4.svg", width: 6cm)
)

#grid(
  columns: (1fr, 1fr),
  img("assets/selection_sort_5.svg", width: 6cm),
  img("assets/selection_sort_6.svg", width: 6cm)
)

== Insertion Sort

Insertion Sort membangun array terurut satu per satu dengan menyisipkan setiap elemen ke posisi yang tepat dalam bagian yang sudah terurut.

#grid(
  columns: (1fr, 1fr),
  img("assets/insertion_sort_1.svg", width: 6cm),
  img("assets/insertion_sort_2.svg", width: 6cm)
)

#grid(
  columns: (1fr, 1fr),
  img("assets/insertion_sort_3.svg", width: 6cm),
  img("assets/insertion_sort_4.svg", width: 6cm)
)

#grid(
  columns: (1fr, 1fr),
  img("assets/insertion_sort_5.svg", width: 6cm),
  img("assets/insertion_sort_6.svg", width: 6cm)
)


== Bubble Sort

Bubble Sort membandingkan pasangan elemen yang berdekatan dan menukarnya jika urutannya salah. Proses ini diulang hingga seluruh array terurut.

#grid(
  columns: (1fr, 1fr),
  img("assets/bubble_sort_1.svg", width: 6cm),
  img("assets/bubble_sort_2.svg", width: 6cm)
)

#grid(
  columns: (1fr, 1fr),
  img("assets/bubble_sort_3.svg", width: 6cm),
  img("assets/bubble_sort_4.svg", width: 6cm)
)

#grid(
  columns: (1fr, 1fr),
  img("assets/bubble_sort_5.svg", width: 6cm),
  img("assets/bubble_sort_6.svg", width: 6cm)
)


== Contoh Input dan Output

#code(
  numbering: false,
  ```bash
$ python main.py
[0, 2, 3, 5, 15, 28, 35]
[0, 2, 3, 5, 15, 28, 35]
[0, 2, 3, 5, 15, 28, 35]
  ```
)

Ketiga algoritma menghasilkan output yang sama, yaitu array terurut:
#eq(
  $[0, 2, 3, 5, 15, 28, 35]$,
)

#pagebreak()

#bibliography(
  "references.bib",
  title: "Referensi",
  style: "ieee",
  full: true,
)
