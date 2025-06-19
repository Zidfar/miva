# Miva Pharmacy App

Aplikasi mobile untuk pemesanan, pencarian, dan pengingat obat non-resep, serta pengambilan obat di apotek terdekat. Dikembangkan menggunakan Flutter.

---

## 📱 Fitur Utama

- Splash & Onboarding (logo aplikasi dan tutorial penggunaan)
- Login & Register pengguna
- Home: Lokasi pengguna, akses kategori, promo mingguan, produk terakhir dibeli
- Categories: Pencarian dan filter produk (obat, vitamin, suplemen, dll)
- Product Detail: Informasi produk, dosis, instruksi, tambah ke cart, wishlist
- Cart: Keranjang belanja, tambah produk, total harga
- Pilih Apotek: Pilihan lokasi apotek terdekat untuk pengambilan dan pembayaran obat
- Profile: Data pengguna, obat aktif, wishlist, riwayat dan status pesanan, link ke reminder
- Reminder: Pengingat minum obat sesuai jadwal dan dosis
- Notifikasi: Pengingat minum obat & info status pesanan

---

## 📂 Struktur Folder

```
lib/
  core/
    constants/
    utils/
    theme/
    models/
    services/
  features/
    auth/
      screens/
      widgets/
      controllers/
    home/
      screens/
      widgets/
      controllers/
    categories/
      screens/
      widgets/
      controllers/
    product/
      screens/
      widgets/
      controllers/
    cart/
      screens/
      widgets/
      controllers/
    profile/
      screens/
      widgets/
      controllers/
    reminder/
      screens/
      widgets/
      controllers/
    apotik/
      screens/
      widgets/
      controllers/
    wishlist/
      screens/
      widgets/
      controllers/
    order/
      screens/
      widgets/
      controllers/
  widgets/
  routes/
  main.dart
```

### Penjelasan Struktur Folder

- **lib/**  
  Folder utama seluruh kode aplikasi Flutter.

- **core/**  
  Berisi resource global, seperti:

  - **constants/** : Konstanta global (warna, ukuran, dsb).
  - **utils/** : Fungsi bantu (helper/utility).
  - **theme/** : Pengaturan tema aplikasi.
  - **models/** : Model data (User, Produk, Apotik, dsb).
  - **services/** : Service untuk API/backend, notifikasi, database, dsb.

- **features/**  
  Berisi setiap fitur utama aplikasi, masing-masing dipisah subfolder:

  - **auth/** : Login, register, onboarding.
  - **home/** : Home screen/dashboard.
  - **categories/** : Kategori produk & pencarian.
  - **product/** : Detail produk.
  - **cart/** : Keranjang & checkout.
  - **profile/** : Akun user, wishlist, riwayat pesanan, dsb.
  - **reminder/** : Pengingat minum obat.
  - **apotik/** : Pilihan lokasi apotek.
  - **wishlist/** : Produk favorit.
  - **order/** : Riwayat & status pesanan.

  Setiap fitur terdiri dari:

  - **screens/** : File tampilan utama untuk fitur tersebut.
  - **widgets/** : Komponen kecil yang reusable dalam fitur.
  - **controllers/** : Logic untuk state management atau pengolahan data.

- **widgets/**  
  Widget global yang bisa digunakan di berbagai fitur (misal: button, card, dsb).

- **routes/**  
  Manajemen rute/navigasi antar halaman aplikasi.

- **main.dart**  
  Entry point aplikasi Flutter.

---

## ⚡ Cara Menjalankan Project

1. Clone repository:
   ```bash
   git clone https://github.com/Zidfar/miva.git
   cd miva
   ```
2. Install dependencies:
   ```bash
   flutter pub get
   ```
3. Jalankan aplikasi:
   ```bash
   flutter run
   ```
   Pastikan emulator/device sudah aktif.

---

## 📝 Panduan Kontribusi

- Gunakan branch baru untuk setiap fitur/bugfix.
- Ikuti struktur folder yang sudah ada.
- Pull Request wajib disertai deskripsi jelas.
- Dokumentasikan jika menambah model/data/service baru.
- Diskusikan fitur/issue di menu Issues repository.

---

## ❗ Catatan

- Produk yang dijual hanya obat dan produk non-resep.
- Pembayaran dilakukan di apotek saat pengambilan produk.
- Data produk dan gambar hanya untuk pengembangan/demo.

---

## 👨‍💻 Tim Pengembang

- Owner: Zidan Farabi
- Kontributor: Muhammad Dzaky Kurniawan, Dennis Satriani Sucipto Putra, Hardi Saputra, Lorensia Jireh
