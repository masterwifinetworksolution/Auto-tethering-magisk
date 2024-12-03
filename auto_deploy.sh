#!/system/bin/sh
# Script untuk menempatkan semua file dari repository GitHub ke direktori dengan izin tulis di Android

# URL repository GitHub
REPO_URL="https://github.com/masterwifinetworksolution/Auto-tethering-magisk/archive/refs/heads/main.zip"

# Direktori sementara untuk mengunduh repository
TEMP_DIR="/sdcard/tmp/repo-temp"

# Direktori target
TARGET_DIR="/data/local/tmp/auto-tethering"

# Buat direktori sementara jika belum ada
mkdir -p $TEMP_DIR

# Hapus isi direktori sementara jika ada
rm -rf $TEMP_DIR/*

# Unduh repository dari GitHub dan ekstrak ke direktori sementara
curl -L $REPO_URL -o $TEMP_DIR/repo.zip
unzip $TEMP_DIR/repo.zip -d $TEMP_DIR

# Buat direktori target jika belum ada
mkdir -p $TARGET_DIR

# Salin semua file dari direktori sementara ke direktori target
cp -r $TEMP_DIR/Auto-tethering-magisk-main/* $TARGET_DIR/

# Hapus direktori sementara
rm -rf $TEMP_DIR

# Logging
LOG_DIR="/sdcard/tmp"
LOG_FILE="$LOG_DIR/auto_deploy.log"
mkdir -p $LOG_DIR
echo "Deploy selesai pada $(date)" >> $LOG_FILE
