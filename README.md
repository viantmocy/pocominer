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

# Pocominer 💕  

Optimized ccminer untuk mining Verus di ARM/Android (Termux).  

---

## 🚀 Quick Setup (Termux)

Copy & paste semua baris ini di Termux:

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

## ❤️ Credits
- Original ccminer by Christian Buchner & Christian H.  
- Verus optimizations by Monkins1010  
- ARM optimizations by Mixed-Nuts  
- Adapted & compiled for my device with love 💕  
