#!/data/data/com.termux/files/usr/bin/bash
pkg update -y && pkg upgrade -y
pkg install -y git wget proot unzip curl libjansson nano root-repo termux-api
set -e

while true; do
    echo "═══════════════════════════════════════"
    echo " 💎 Binary ccminer tersedia di repo ini"
    echo " Apakah kamu ingin compile ulang sesuai CPU?"
    echo "   [Y] Ya, jalankan setup.sh untuk compile ulang"
    echo "   [N] Tidak, gunakan binary bawaan"
    echo "═══════════════════════════════════════"
    read -p " Pilihan kamu (Y/N): " choice

    # Ubah input ke huruf besar supaya Y/y dan N/n sama
    choice_upper=$(echo "$choice" | tr '[:lower:]' '[:upper:]')

    if [[ "$choice_upper" == "Y" ]]; then
        echo "[+] Menjalankan setup.sh untuk compile ulang..."
        bash -x ./setup.sh
        echo "✅ Setup selesai, binary ccminer baru siap di ~/pocominer/ccminer!"
        break
    elif [[ "$choice_upper" == "N" ]]; then
        echo "⚡ Menggunakan binary bawaan di repo ini."
        break
    else
        echo "❌ Pilihan tidak valid. Harap masukkan Y atau N."
    fi
done
