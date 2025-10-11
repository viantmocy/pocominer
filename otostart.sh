#!/bin/bash

# --- AUTO-MINER SCRIPT FOR REBOOT ---
LOG_FILE=~/pocominer/miner_boot.log

# Cek apakah folder pocominer ada
if [ ! -d ~/pocominer ]; then
    echo "[$(date)] ERROR: Folder pocominer tidak ditemukan!" >> $LOG_FILE
    exit 1
fi

echo "[$(date)] Memulai auto-miner script..." >> $LOG_FILE

# Aktifkan wakelock agar CPU tetap hidup
termux-wake-lock

# Masuk ke folder pocominer
cd ~/pocominer

# Jalankan mining dengan start.sh
if [ -f ./start.sh ]; then
    echo "[$(date)] Menjalankan mining dengan start.sh..." >> $LOG_FILE
    nohup ./start.sh >> $LOG_FILE 2>&1 &
else
    echo "[$(date)] ERROR: File start.sh tidak ditemukan!" >> $LOG_FILE
    exit 1
fi

echo "[$(date)] Miner seharusnya sudah berjalan." >> $LOG_FILE
