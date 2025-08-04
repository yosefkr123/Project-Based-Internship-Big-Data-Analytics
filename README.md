# 📊 Kimia Farma – Business Performance Analytics (2020–2023)

Proyek ini bertujuan untuk membangun **dashboard analitik interaktif** yang menampilkan performa bisnis PT Kimia Farma dari tahun 2020 hingga 2023. Seluruh proses dimulai dari pengolahan data di **Google BigQuery**, lalu divisualisasikan menggunakan **Looker Studio**.

---

## 📁 Dataset

Project ini menggunakan empat tabel utama:
- `kf_final_transaction` (data transaksi)
- `kf_product` (informasi produk)
- `kf_kantor_cabang` (data lokasi & rating cabang)
- `kf_inventory` (data stok barang)

---

## 🏗️ Proses dan Strategi

1. **Import Data ke BigQuery**
   - Semua dataset diunggah dan disimpan di Google BigQuery.
   - Digunakan format standar dengan penyesuaian skema data jika diperlukan.

2. **Query Pembuatan Tabel Analisa**
   - Membuat tabel `analisa_kinerja` dengan perintah `CREATE OR REPLACE TABLE`.
   - Melakukan `LEFT JOIN` antar tabel berdasarkan `product_id` dan `branch_id`.
   - Menambahkan perhitungan seperti:
     - `nett_sales` = harga setelah diskon
     - `nett_profit` = laba berdasarkan margin
     - Margin ditentukan dengan logika `CASE WHEN` berdasarkan rentang harga

3. **Visualisasi di Looker Studio**
   - Dashboard menyajikan data interaktif dan ringkasan performa perusahaan.

---

## 📊 Komponen Dashboard

- 🔹 **Ringkasan KPI**: Total transaksi, penjualan bersih, laba bersih, rating transaksi & cabang.
- 🔹 **Tren Penjualan Tahunan**: Grafik penjualan dari tahun ke tahun.
- 🔹 **Geo Map Profit**: Distribusi total profit per provinsi di Indonesia.
- 🔹 **Top 10 Provinsi (Transaksi & Penjualan)**: Wilayah dengan kontribusi tertinggi.
- 🔹 **Produk Terlaris**: Produk dengan jumlah transaksi terbanyak & rating tertinggi.
- 🔹 **Analisis Cabang**: Cabang dengan rating tinggi namun transaksi rendah (insight strategis).
- 🔹 **Analisis Tambahan**: Perbandingan profit vs rating, distribusi harga, dll.

---

## 🔗 Link Dashboard

📎 Lihat tampilan dashboard interaktif di Looker Studio:  
👉 [Klik di sini untuk melihat dashboard](https://lookerstudio.google.com/reporting/65f7c55d-c588-4738-bd2b-bc370ad3e220)

---

## 📌 Tools & Teknologi

- **Google BigQuery**: Untuk pengolahan dan analisis data
- **Google Looker Studio**: Untuk membuat visualisasi dan dashboard
- **SQL Standard**: Untuk menulis query dan membentuk tabel analisa

---

## 👤 Author

Created by Yosef – Final Task Rakamin x Kimia Farma – Big Data Analytics  
