# Pertemuan 6: Requirements Analysis and Modeling

Requirements analysis diletakkan di antara elicitation dan specification (hlm. 3). Fokusnya menjawab apa yang akan dibangun, bukan bagaimana membangunnya: "sistem mengizinkan pengguna menarik tunai" adalah what, sedangkan penyimpanan atribut di hash table adalah how (hlm. 4). Tujuannya menemukan masalah pada kebutuhan, terutama ketidaklengkapan dan inkonsistensi, dan sebagian analisis berjalan menyela elicitation begitu masalah terlihat (hlm. 6). Analisis dan elicitation saling memberi umpan, dan analisis berjalan bersama pemodelan (hlm. 7).

Proses analisis memeriksa tiga hal: necessity, apakah kebutuhan berkontribusi pada tujuan bisnis; consistency and completeness, apakah ada kontradiksi atau layanan yang terlewat; dan feasibility, apakah kebutuhan masuk akal terhadap anggaran serta jadwal (hlm. 8-11). Dua teknik yang diperkenalkan adalah analysis checklist dan interaction matrix (hlm. 12). Checklist menilai tiap kebutuhan terhadap butir seperti premature design, gabungan beberapa kebutuhan, gold plating, penggunaan perangkat non-standar, kesesuaian dengan tujuan bisnis, ambiguitas, realisme, dan testability (hlm. 15-18). Interaction matrix membandingkan kebutuhan berpasangan: 1 untuk konflik, 1000 untuk tumpang tindih, dan 0 untuk independen (hlm. 20-21).

Negosiasi muncul karena ketidaksepakatan tidak terhindarkan ketika stakeholder banyak; konflik dipandang sebagai perbedaan prioritas, bukan kegagalan (hlm. 23). Waktu negosiasi perlu disediakan sejak perencanaan karena kompromi memakan waktu (hlm. 24). Tahapnya discussion, prioritization, dan agreement (hlm. 25-28), dan pertemuan negosiasi dijalankan dalam tiga tahap: information, discussion, resolution (hlm. 30-31).

Bagian pemodelan menegaskan elicitation, analisis, dan modeling saling bercampur (hlm. 32). Use case ditulis dari sudut pandang aktor dan menggambarkan interaksi pada situasi tertentu (hlm. 33). Tiga perspektif pemodelan dibedakan: data dengan ER diagram dan class diagram, functional dengan data flow diagram dan activity diagram, serta behavioral dengan state chart (hlm. 35-39). Functional requirement menjelaskan perilaku sistem, sedangkan non-functional requirement memuat constraints dan qualities (hlm. 40); pada contoh blood pressure monitor, pengukuran tekanan darah adalah fungsi, pembacaan selesai dalam 10 detik adalah performance, dan peluang gagal di bawah 0,01 pada 500 pembacaan pertama adalah reliability (hlm. 45).

## Poin kunci

- Analisis menjawab what, bukan how (hlm. 4).
- Tiga pemeriksaan: necessity, consistency and completeness, feasibility (hlm. 8-11).
- Checklist menandai premature design, gold plating, ambiguitas, dan ketidaktestable-an (hlm. 15-18).
- Interaction matrix memakai 1 untuk konflik, 1000 untuk overlap, 0 untuk independen (hlm. 20).
- Negosiasi tiga tahap: discussion, prioritization, agreement (hlm. 25-28).
- Tiga perspektif model: data, functional, behavioral (hlm. 35-39).

## Istilah

- Requirements analysis: proses memahami dan mendokumentasikan kebutuhan sebelum spesifikasi.
- Necessity checking: pemeriksaan apakah kebutuhan berkontribusi pada tujuan bisnis.
- Gold plating: tambahan kosmetik yang sebenarnya tidak diperlukan.
- Interaction matrix: tabel yang memetakan konflik dan tumpang tindih antar-requirement.
- Use case: narasi interaksi aktor dengan sistem pada situasi tertentu.
- Data flow diagram: model aliran data dan proses dalam sistem.
- State chart: model perilaku sistem berbasis perubahan keadaan.

## Sumber

- `requirements-analysis-and-modeling.pdf`, hlm. 3-45.
