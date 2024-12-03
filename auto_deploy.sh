#!/system/bin/sh
# Script untuk menempatkan semua file dari repository GitHub ke root direktori Android

# URL repository GitHub
REPO_URL="https://github.com/masterwifinetworksolution/Auto-tethering-magisk.git"

# Direktori sementara untuk mengkloning repository
TEMP_DIR="/sdcard/tmp/repo-temp"  # Menggunakan /sdcard/tmp

# Direktori root Android
ROOT_DIR="/system"

# Buat direktori sementara jika belum ada
mkdir -p $TEMP_DIR

# Hapus isi direktori sementara jika ada
rm -rf $TEMP_DIR/*

# Kloning repository dari GitHub ke direktori sementara
git clone $REPO_URL $TEMP_DIR

# Salin semua file dari direktori sementara ke root direktori Android
cp -r $TEMP_DIR/* $ROOT_DIR/

# Hapus direktori sementara
rm -rf $TEMP_DIR

# Logging
LOG_DIR="/sdcard/tmp"  # Menggunakan /sdcard/tmp untuk log
LOG_FILE="$LOG_DIR/auto_deploy.log"
mkdir -p $LOG_DIR
echo "Deploy selesai pada $(date)" >> $LOG_FILE
