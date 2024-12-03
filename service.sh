#!/system/bin/sh
# Script untuk menjalankan service auto tethering

# Jalankan script auto tethering setiap kali USB terhubung atau dilepas
while true; do
    /system/bin/auto_tether.sh
    sleep 30
done
