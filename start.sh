#!/bin/bash

# --- START MINING SCRIPT ---
LOG_FILE=~/pocominer/miner.log

# Cek apakah file config.json ada
if [ ! -f ~/pocominer/config.json ]; then
    echo "[$(date)] ERROR: File config.json tidak ditemukan!" >> $LOG_FILE
    exit 1
fi

echo "[$(date)] Memulai mining..." >> $LOG_FILE

# Aktifkan wakelock agar CPU tetap hidup
termux-wake-lock

# Jalankan ccminer dengan konfigurasi
cd ~/pocominer
if [ -f ./ccminer ]; then
    echo "[$(date)] Menjalankan ccminer..." >> $LOG_FILE
    nohup ./ccminer -c config.json >> $LOG_FILE 2>&1 &
else
    echo "[$(date)] ERROR: File ccminer tidak ditemukan!" >> $LOG_FILE
    exit 1
fi

echo "[$(date)] Mining seharusnya sudah berjalan." >> $LOG_FILE
