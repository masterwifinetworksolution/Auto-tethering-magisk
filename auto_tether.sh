#!/data/local/tmp/sh
# Script untuk mengaktifkan tethering USB secara otomatis ketika USB terhubung

# Path ke perintah untuk mengaktifkan tethering USB
TETHERING_CMD="/data/local/tmp/tethering enable"

# Path ke file log untuk mencatat aktivitas
LOG_FILE="/data/local/tmp/auto_tether.log"

# Fungsi untuk mengaktifkan tethering USB
enable_tethering() {
    echo "Mengaktifkan tethering USB..." >> $LOG_FILE
    $TETHERING_CMD
}

# Fungsi untuk menonaktifkan tethering USB
disable_tethering() {
    echo "Menonaktifkan tethering USB..." >> $LOG_FILE
    /data/local/tmp/tethering disable
}

# Cek apakah USB terhubung
if [ $(cat /sys/class/power_supply/usb/online) -eq 1 ]; then
    enable_tethering
else
    disable_tethering
fi
