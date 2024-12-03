# Auto Tethering Magisk Module

## Deskripsi
Module Magisk ini secara otomatis mengaktifkan tethering USB ketika USB terhubung ke perangkat Android. Script ini akan memeriksa status koneksi USB setiap 30 detik dan mengaktifkan atau menonaktifkan tethering USB sesuai dengan statusnya.

## Cara Penggunaan

1. **Clone repository ini ke perangkat Anda:**

```sh
git clone https://github.com/masterwifinetworksolution/Auto-tethering-magisk.git
```

2. **Jalankan script deploy:**

```sh
su -c "sh /path/to/auto_deploy.sh"
```

Script deploy akan secara otomatis menyalin semua file yang diperlukan ke direktori root perangkat Android Anda dan mengatur module Magisk.

## Struktur Repository
- `auto_tether.sh`: Script untuk mengaktifkan tethering USB secara otomatis ketika USB terhubung.
- `service.sh`: Script untuk menjalankan service auto tethering.
- `auto_tether.log`: File log untuk mencatat aktivitas tethering.
- `auto_tether.xml`: File konfigurasi module Magisk.
- `auto_deploy.sh`: Script untuk menempatkan semua file dari repository ke root direktori perangkat Android dan mengatur module Magisk.

## Catatan
Pastikan Anda memiliki akses root dan Magisk terpasang di perangkat Android Anda. Script ini telah diuji pada beberapa perangkat, namun jika Anda mengalami masalah atau memiliki pertanyaan, jangan ragu untuk membuka issue di repository ini.

## Kontribusi
Jika Anda ingin berkontribusi pada proyek ini, silakan buat pull request atau buka issue untuk diskusi lebih lanjut.

## Lisensi
Proyek ini dilisensikan di bawah MIT License. Lihat file [LICENSE](./LICENSE) untuk informasi lebih lanjut.

---

Terima kasih telah menggunakan Auto Tethering Magisk Module dari Simaster
