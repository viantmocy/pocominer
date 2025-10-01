
---

💕 POCOMINER 💕

> Personal used of Poco M4 Pro for mining VerusCoin with help of ccminer optimized by the original creators.



⚠️ Disclaimer: I am not involved in developing or being part of the development of this project.
This repository only contains my personal setup for learning and mining purposes. Everyone is welcome to try, but use at your own risk.


---

✨ Features

📱 Works on ARM (Poco M4 Pro, Cortex-A53, A55, A76, Kryo, Exynos, dsb.)

⚡ Optimized universal build script (setup.sh)

🎨 Colorful start script (start.sh) dengan wakelock support

🛠 Auto-detect CPU architecture + best compile flags

💗 Simple usage, clone & run



---

Pocominer 💕

Optimized ccminer untuk mining Verus di ARM/Android (Termux).


---

🚀 Quick Setup (Termux)

Copy & paste semua baris ini di Termux:

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


---

⚙️ Config

Semua pengaturan ada di file config.json.
Kamu bisa tuning sesuai jumlah core & performa device.

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

🔧 Parameter Utama

Parameter	Penjelasan	Contoh

threads	Jumlah thread mining. Sesuaikan dengan jumlah core. <br>• Quad-core: 4 <br>• Hexa-core: 6 <br>• Octa-core: 8 <br>• 12-core: 12	4, 6, 8, 12
cpu-affinity	Masking core mana yang dipakai (hex). <br>Contoh: 0xF (4 core pertama), 0xFF (8 core), 0xFFF (12 core).	0xF, 0xFF, 0xFFF
cpu-priority	Prioritas proses CPU (1 = rendah, 5 = normal, 9 = tinggi). Untuk mining disarankan 5.	5
statsavg	Interval rata-rata statistik (detik). Nilai besar = stabil, kecil = lebih cepat update.	60
quiet	Jika true, output lebih ringkas. Jika false, semua log tampil.	true



---

📄 Contoh Config

🔹 Low-end (Quad-core, 4 threads)

{
  "algo": "verus",
  "threads": 4,
  "cpu-affinity": "0xF",
  "cpu-priority": 5,
  "statsavg": 60,
  "quiet": true,
  "pools": [
    {
      "url": "stratum+tcp://ap.luckpool.net:3956",
      "user": "YOUR_WALLET.lowend",
      "pass": "x"
    }
  ]
}

🔹 Mid-range (Hexa-core, 6 threads)

{
  "algo": "verus",
  "threads": 6,
  "cpu-affinity": "0x3F",
  "cpu-priority": 5,
  "statsavg": 60,
  "quiet": true,
  "pools": [
    {
      "url": "stratum+tcp://ap.luckpool.net:3956",
      "user": "YOUR_WALLET.midrange",
      "pass": "x"
    }
  ]
}

🔹 High-end (Octa-core, 8 threads)

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
      "user": "YOUR_WALLET.highend",
      "pass": "x"
    }
  ]
}

🔹 Powerful (12-core)

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
      "user": "YOUR_WALLET.power",
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



