# Kecerdasan Artifisial — Roadmap Curi Start

> D-IV TRPL, Sekolah Vokasi UGM · Dosen: Dinar Nugroho Pratomo, S.Kom., M.IM., M.Cs.

---

## Overview

Mata kuliah ini ternyata lebih berat ke **applied machine learning** daripada classical AI — berdasarkan bank soal aktual, fokusnya adalah data preprocessing, KNN, evaluasi model, neural networks, dan unsupervised learning. Topik classical AI dari silabus (search algorithms, agents, logic) tidak muncul di dua exam terakhir. Roadmap ini mengikuti urutan yang sesuai dengan bobot ujian nyata.

---

## Prasyarat

Sebelum terjun ke materi inti, pastikan nggak ngambang di area berikut:

| Area                          | Yang perlu di-refresh                                               |
| ----------------------------- | ------------------------------------------------------------------- |
| **Matematika Diskrit**        | Notasi himpunan, logika proposisional                               |
| **Probabilitas & Statistika** | Mean, std dev, distribusi normal, Bayes theorem dasar               |
| **Algoritma & Struktur Data** | Kompleksitas O(n), array/list, sorting — cukup yang dasar           |
| **Python**                    | List comprehension, NumPy array, pandas DataFrame, matplotlib dasar |

Kalau statistika masih abu-abu, prioritaskan ini sebelum masuk Topik 3 ke bawah.

---

## Topik Inti (urutan belajar)

1. **Konsep Dasar AI** — Pahami perbedaan fundamental antara AI, Machine Learning, dan Deep Learning beserta contoh aplikasinya di dunia nyata; kenali tiga tahap perkembangan AI (computational, perceptual, cognitive intelligence).

2. **Data Preprocessing** — Pelajari cara menangani missing values dan outlier, lalu kuasai tiga teknik wajib: normalisasi min-max, standardisasi Z-score, dan encoding kategorikal (label encoding, one-hot encoding, ordinal encoding) — soal UTS nyaris selalu minta perhitungan manual.

3. **Supervised Learning — Konsep Dasar** — Pahami konsep training set vs test set, underfitting vs overfitting, bias-variance tradeoff, dan mengapa kita perlu validasi model sebelum deploy.

4. **K-Nearest Neighbors (KNN)** — Pelajari cara kerja algoritma KNN, cara memilih nilai K yang optimal, perbedaan tiga distance metrics (Euclidean, Manhattan, Minkowski), dan latih diri menghitung klasifikasi manual karena soal UTS selalu meminta ini.

5. **Evaluasi Model Klasifikasi** — Kuasai confusion matrix (TP, TN, FP, FN) dan turunannya: accuracy, precision, recall/sensitivity, F1-score, specificity — wajib bisa derive angkanya dari data mentah karena bobot soal ini 30%.

6. **Regresi Linear & Logistik** — Pahami perbedaan regression vs classification task, cara kerja logistic regression, dan kenapa softmax adalah generalisasi logistic regression untuk multi-class.

7. **Neural Networks** — Pelajari arsitektur (perceptron → hidden layers → output), activation functions (sigmoid, tanh, ReLU, Leaky ReLU, softmax), forward propagation, dan backpropagation/gradient descent; pahami masalah vanishing gradient dan solusinya (ReLU), serta dropout sebagai teknik regularisasi.

8. **Unsupervised Learning** — Pelajari cara kerja K-means clustering dan DBSCAN, pahami perbedaannya dengan K-medoids, dan pastikan bisa membedakan mana algoritma supervised vs unsupervised (soal UAS ada pertanyaan ini).

9. **NLP Intro** — Pahami konsep machine learning untuk teks (spam filtering sebagai contoh klasik), word embeddings (Word2Vec), dan metrik evaluasi BLEU — cukup pada level konseptual untuk UAS.

10. **Computer Vision Intro** — Pahami kenapa CNN (Convolutional Neural Network) dipakai untuk image feature extraction, konsep mAP dan IOU sebagai metrik object detection — ini muncul sebagai pilihan ganda di UAS.

11. **Praktik dengan Tools** — Implementasikan topik 2–10 menggunakan scikit-learn dan TensorFlow/Keras; pahami built-in metrics Keras (Recall, Accuracy, Precision — dan kenapa `Mean` bukan termasuk) serta optimizer Adam (terdiri dari Momentum + RMSProp).

---

## Resource Kurasi

### Kanonik

- **Russell & Norvig — _Artificial Intelligence: A Modern Approach_ (4th ed., 2021)**
  Pearson. ISBN 9780134610993. Companion site (kode, data, beberapa chapter sample) gratis di [aima.cs.berkeley.edu](https://aima.cs.berkeley.edu).
  [EN] · [Berbayar, companion site Gratis] · Buku · Rujukan utama untuk classical AI dan konteks luas ML

- **Andrew Ng — _Machine Learning Specialization_**
  DeepLearning.AI × Stanford Online via Coursera. Tiga course: supervised, unsupervised, RL intro.
  [EN] · [Gratis audit / berbayar untuk sertifikat] · Video + lab
  [deeplearning.ai/courses/machine-learning-specialization](https://www.deeplearning.ai/courses/machine-learning-specialization/)

- **Udacity — _Intro to Artificial Intelligence_ (CS271)**
  Dibuat oleh Sebastian Thrun (ex-Stanford, pendiri Udacity) dan Peter Norvig (co-author AIMA). Covers probabilistic reasoning, search, ML, NLP, CV — sangat selaras dengan silabus lengkap mata kuliah ini.
  [EN] · [Gratis] · Video
  [udacity.com/course/intro-to-artificial-intelligence--cs271](https://www.udacity.com/course/intro-to-artificial-intelligence--cs271)

---

### Hidden gems (verified by experts)

- **StatQuest with Josh Starmer — YouTube Channel & statquest.org**
  Josh Starmer adalah PhD dari UNC-Chapel Hill; channelnya disebut _"Patron Saint of Silicon Valley"_ oleh para ML practitioner karena banyak yang menonton sebelum job interview (sebutan dari episode podcast SuperDataScience #553 dan wawancara Towards Data Science). Sangat recommended untuk topik yang paling sering di-struggle: KNN, confusion matrix, normalisasi, neural networks — semua dijelaskan visual step-by-step tanpa menurunkan kedalaman.
  [EN] · [Gratis] · Video
  [youtube.com/c/joshstarmer](https://www.youtube.com/channel/UCtYLUTtgS3k1Fg4y5tAhLbw) · [statquest.org](https://statquest.org/)

- **3Blue1Brown — _Neural Networks_ series**
  Dibuat oleh Grant Sanderson (matematikawan, alumni Stanford); direkomendasikan langsung oleh Lex Fridman dalam podcast episode #118 untuk membangun intuisi visual tentang neural networks sebelum menyelami kode. Seri ini cover backpropagation secara visual — cocok sebelum pindah ke implementasi Keras.
  [EN] · [Gratis] · Video (7 episode ~15–20 menit)
  [3blue1brown.com/lessons/neural-networks](https://www.3blue1brown.com/lessons/neural-networks/)
  Playlist YouTube: [youtube.com/playlist?list=PLZZWrBYkx7Otcjr3eCLZDCgfpqnxMY29s](https://www.youtube.com/playlist?list=PLZZWrBYkx7Otcjr3eCLZDCgfpqnxMY29s)

- **Google — _Machine Learning Crash Course_**
  Dibuat dan digunakan internal oleh Google engineers untuk onboarding ML (diumumkan ke publik 2018). Sangat praktis: setiap konsep disertai interactive exercise di Google Colab. Sangat cocok untuk topik preprocessing, neural networks, dan metrik evaluasi yang persis muncul di exam.
  [EN] · [Gratis] · Teks + video + Colab exercises
  [developers.google.com/machine-learning/crash-course](https://developers.google.com/machine-learning/crash-course)

- **fast.ai — _Practical Deep Learning for Coders_**
  Jeremy Howard adalah ex-Kaggle #1 global dua tahun berturut-turut; direkomendasikan oleh alumni yang masuk Google Brain dan OpenAI (dicatat di situs fast.ai). Pendekatan top-down: langsung build model nyata, baru drill ke teori. Relevan untuk topik neural networks dan CV intro di bagian akhir semester.
  [EN] · [Gratis] · Video + Jupyter notebooks (bisa jalankan di Colab)
  [course.fast.ai](https://course.fast.ai/)

---

## Fokus Bank-Soal

Berdasarkan analisis dua soal exam Genap 2024/2025 (UTS April 2025, UAS Juni 2025):

### UTS — Pola soal & bobot

| Topik                                                       | Bobot | Tipe soal                      |
| ----------------------------------------------------------- | ----- | ------------------------------ |
| AI vs ML vs DL + contoh aplikasi                            | 10%   | Esai                           |
| Data preprocessing (cleaning, normalisasi, encoding)        | 30%   | Hitung manual + esai           |
| KNN (konsep, K optimal, distance metrics, klasifikasi)      | 30%   | Hitung manual step-by-step     |
| Confusion matrix + accuracy/precision/recall/F1/specificity | 30%   | Hitung manual dari TP/TN/FP/FN |

**Tips UTS:** Tiga soal terakhir selalu minta **perhitungan manual dengan angka konkret** — latih ini sampai reflex. Soal data preprocessing sering pakai dataset tabel kecil yang harus di-cleaning dan di-transform langsung.

### UAS — Pola soal & bobot

| Topik                                                                | Bobot            | Tipe soal                                 |
| -------------------------------------------------------------------- | ---------------- | ----------------------------------------- |
| Neural networks (arsitektur, activation functions, training process) | ~40%             | True/False + pilihan ganda + multi-answer |
| Unsupervised learning (K-means, DBSCAN, K-medoids)                   | Termasuk di atas | Pilihan ganda                             |
| ML definitions & taxonomy (supervised vs unsupervised vs RL)         | Termasuk di atas | Pilihan ganda                             |
| Project ML aplikasi kelompok                                         | 20%              | Presentasi + self-assessment kontribusi   |
| NLP & CV intro (konseptual)                                          | ~40%             | Pilihan ganda                             |

**Tips UAS:** Soal True/False dan pilihan ganda butuh pemahaman konseptual yang presisi — jangan hafal, pahami _kenapa_. Contoh jebakan: "tanh bisa solve vanishing gradient" (False — ReLU yang lebih efektif), "dropout hanya untuk neural networks" (False — bisa dipakai layer lain), "softmax hanya untuk binary" (False — ini generalisasi untuk multi-class).

### Insight penting

> Topik classical AI dari silabus — search algorithms (BFS, DFS, A\*, minimax), intelligent agents, knowledge representation, logika predikat — **tidak muncul di dua bank soal ini sama sekali**. Bisa jadi materi ini diajarkan tapi tidak diujikan, atau bergeser ke project. Prioritaskan ML topics; pelajari classical AI hanya jika ada indikasi dari dosen.

---

## Estimasi Waktu

Total self-study di luar jam kuliah untuk persiapan komprehensif: **±35–40 jam**

| Topik                                             | Estimasi    |
| ------------------------------------------------- | ----------- |
| Konsep dasar AI + prasyarat refresh               | 3 jam       |
| Data preprocessing (konsep + latihan soal manual) | 5 jam       |
| Supervised learning dasar + KNN                   | 5 jam       |
| Evaluasi model (confusion matrix + metrics)       | 4 jam       |
| Regresi linear & logistik                         | 3 jam       |
| Neural networks (3Blue1Brown → MLCC → latihan)    | 8 jam       |
| Unsupervised learning                             | 4 jam       |
| NLP + CV intro (konseptual)                       | 3 jam       |
| Praktik tools (scikit-learn, Keras/TF)            | 5 jam       |
| **Total**                                         | **~40 jam** |

Strategi pacing: 2–3 minggu sebelum UTS fokus topik 1–5 (data preprocessing + KNN + metrics dulu karena bobot 90%). Setelah UTS, lanjut topik 6–11 untuk UAS.
