# Auto-tethering-magisk

Mengaktifkan tethering USB secara otomatis menggunakan module Magisk dan root Magisk, dengan jeda 30 detik setiap kali memeriksa status USB.

### 1. Buat file `auto_tether.sh`

```sh
#!/system/bin/sh
# Script untuk mengaktifkan tethering USB secara otomatis ketika USB terhubung

# Path ke perintah untuk mengaktifkan tethering USB
TETHERING_CMD="/system/bin/tethering enable"

# Path ke file log untuk mencatat aktivitas
LOG_FILE="/system/log/auto_tether.log"

# Fungsi untuk mengaktifkan tethering USB
enable_tethering() {
    echo "Mengaktifkan tethering USB..." >> $LOG_FILE
    $TETHERING_CMD
}

# Fungsi untuk menonaktifkan tethering USB
disable_tethering() {
    echo "Menonaktifkan tethering USB..." >> $LOG_FILE
    /system/bin/tethering disable
}

# Cek apakah USB terhubung
if [ $(cat /sys/class/power_supply/usb/online) -eq 1 ]; then
    enable_tethering
else
    disable_tethering
fi
```

### 2. Buat file `service.sh`

```sh
#!/system/bin/sh
# Script untuk menjalankan service auto tethering

# Jalankan script auto tethering setiap kali USB terhubung atau dilepas
while true; do
    /system/bin/auto_tether.sh
    sleep 30
done
```

### 3. Buat file log `auto_tether.log`

```sh
# Log untuk auto tethering
```

### 4. Buat file module Magisk 

`auto_tether.xml`

```xml
<?xml version="1.0" encoding="utf-8"?>
<module>
    <name>Auto USB Tethering</name>
    <type>service</type>
    <service>
        <name>auto_tethering</name>
        <script>service.sh</script>
    </service>
</module>
```

### 5. Pasang module ke Magisk:

- Salin file `auto_tether.xml` ke direktori `Magisk/Modules/` di perangkat Anda.
- Jalankan aplikasi Magisk dan pilih "Install to System".

Dengan script ini, tethering USB akan aktif secara otomatis setiap kali USB terhubung dan akan menonaktifkan tethering jika USB dilepas, dengan pemeriksaan setiap 30 detik.
