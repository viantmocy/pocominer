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

## 🚀 Quick Start (Termux)
Clone repo ini dan langsung build di device-mu:

```bash
pkg install -y git
git clone https://github.com/viantmocy/pocominer
cd pocominer
chmod +x setup.sh start.sh
./setup.sh   # build ccminer sesuai arsitektur CPU
./start.sh   # mulai mining dengan cinta 💕


---

⚙️ Config

Edit config.json untuk menyesuaikan pool, wallet, dan threads:

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


---

❤️ Credits

Original ccminer by Christian Buchner & Christian H.

Verus optimizations by Monkins1010

ARM optimizations by Mixed-Nuts

Adapted & compiled for my device with love 💕



---

📦 Copy & Paste Setup (Termux)

👉 Tinggal copy block ini, paste ke Termux, dan semuanya siap jalan:

pkg update -y && pkg upgrade -y
pkg install -y git

# Clone repo
git clone https://github.com/viantmocy/pocominer
cd pocominer

# Izin eksekusi + build
chmod +x setup.sh start.sh
./setup.sh

# Jalankan mining
./start.sh


---

🌸 Made with love by viantmocy 🌸

Jadi di bagian **📦 Copy & Paste Setup** ada satu blok besar tinggal sekali copy di GitHub, langsung jalan di Termux.

