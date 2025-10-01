# 💕 POCOMINER 💕
> Personal used of **Poco M4 Pro** for mining VerusCoin with help of `ccminer` optimized by the original creators.  

⚠️ **Disclaimer**: I am **not involved** in developing or being part of the development of this project.  
This repository only contains my **personal setup** for learning and mining purposes. Everyone is welcome to try, but use at your own risk.  

---

## ✨ Features
- 📱 Works on ARM (Poco M4 Pro, Cortex-A53, A55, A76, Exynos, Kryo, etc.)
- ⚡ Optimized universal build script (`setup.sh`)
- 🎨 Colorful start script (`start.sh`) with wakelock support
- 🛠 Auto-detects CPU architecture and applies best compile flags
- 💗 Simple usage, just clone & run

---

## 📊 Status
[![Platform](https://img.shields.io/badge/Platform-ARM%20%7C%20Termux-green?style=flat-square)](#)  
[![Status](https://img.shields.io/badge/Build-Working-success?style=flat-square)](#)  
[![License](https://img.shields.io/badge/License-Personal-blueviolet?style=flat-square)](#)  

---

## 🚀 Quick Setup (Termux)

Klik tombol di bawah untuk **copy semua perintah setup**:  

[![Copy Setup](https://img.shields.io/badge/📋%20Copy%20Setup-Termux-blueviolet?style=for-the-badge)](#)  

```bash
pkg update -y && pkg upgrade -y
pkg install -y git

# Clone repo
git clone https://github.com/viantmocy/pocominer
cd pocominer

# Build miner
chmod +x setup.sh start.sh install.sh
./install.sh

# Jalankan mining
./start.sh
```

---

## ⚙️ Config

Edit file `config.json` untuk menyesuaikan pool, wallet, dan threads:  

```json
{
  "algo": "verus",
  "threads": 8,
  "cpu-affinity": "0xFF",
  "cpu-priority": 5,
  "statsavg": 60,
  "quiet": true,
  "pools": [
    {
      "url": "stratum+tcp://ap.luckpool.net:3956",
      "user": "YOUR_WALLET.YOUR_WORKER",
      "pass": "x"
    }
  ]
}
```

---

## 🔧 Parameter Detail

- **threads** → jumlah core yang dipakai. Sesuaikan dengan device:  
  - Single/Dual-core → 1 atau 2  
  - Quad-core (4) → 3 atau 4  
  - Hexa-core (6) → 5 atau 6  
  - Octa-core (8) → 7 atau 8  
  - Deca-core (10) → 9 atau 10  
  - Dodeca-core (12) → 11 atau 12  

- **cpu-affinity** → mask core yang dipakai (contoh `0xFF` artinya semua core).  
- **cpu-priority** → prioritas proses (1 rendah → 5 tinggi).  
- **statsavg** → waktu rata-rata laporan (detik).  
- **quiet** → jika `true`, log lebih singkat.  

---

## 📑 Contoh Config

**Dual-core (2 threads):**
```json
{
  "algo": "verus",
  "threads": 2,
  "cpu-affinity": "0x3",
  "cpu-priority": 3,
  "statsavg": 60,
  "quiet": true,
  "pools": [
    {
      "url": "stratum+tcp://ap.luckpool.net:3956",
      "user": "YOUR_WALLET.dual",
      "pass": "x"
    }
  ]
}
```

---

**Quad-core (4 threads):**
```json
{
  "algo": "verus",
  "threads": 4,
  "cpu-affinity": "0xF",
  "cpu-priority": 4,
  "statsavg": 60,
  "quiet": true,
  "pools": [
    {
      "url": "stratum+tcp://ap.luckpool.net:3956",
      "user": "YOUR_WALLET.quad",
      "pass": "x"
    }
  ]
}
```

---

**Hexa-core (6 threads):**
```json
{
  "algo": "verus",
  "threads": 6,
  "cpu-affinity": "0x3F",
  "cpu-priority": 4,
  "statsavg": 60,
  "quiet": true,
  "pools": [
    {
      "url": "stratum+tcp://ap.luckpool.net:3956",
      "user": "YOUR_WALLET.hexa",
      "pass": "x"
    }
  ]
}
```

---

**Octa-core (8 threads):**
```json
{
  "algo": "verus",
  "threads": 8,
  "cpu-affinity": "0xFF",
  "cpu-priority": 5,
  "statsavg": 60,
  "quiet": true,
  "pools": [
    {
      "url": "stratum+tcp://ap.luckpool.net:3956",
      "user": "YOUR_WALLET.octa",
      "pass": "x"
    }
  ]
}
```

---

**Deca-core (10 threads):**
```json
{
  "algo": "verus",
  "threads": 10,
  "cpu-affinity": "0x3FF",
  "cpu-priority": 5,
  "statsavg": 60,
  "quiet": true,
  "pools": [
    {
      "url": "stratum+tcp://ap.luckpool.net:3956",
      "user": "YOUR_WALLET.deca",
      "pass": "x"
    }
  ]
}
```

---

**Dodeca-core (12 threads):**
```json
{
  "algo": "verus",
  "threads": 12,
  "cpu-affinity": "0xFFF",
  "cpu-priority": 5,
  "statsavg": 60,
  "quiet": true,
  "pools": [
    {
      "url": "stratum+tcp://ap.luckpool.net:3956",
      "user": "YOUR_WALLET.dodeca",
      "pass": "x"
    }
  ]
}
```

---

## ❤️ Credits

- Original ccminer by Christian Buchner & Christian H.  
- Verus optimizations by Monkins1010  
- ARM optimizations by Mixed-Nuts  
- Adapted & compiled for my device with love 💕  

---
