#!/data/data/com.termux/files/usr/bin/bash
# ===========================================
#   INSTALLER SCRIPT UNTUK POCOMINER
#   By Leafia 💕 untuk sayangku
# ===========================================

set -e
cd ~/pocominer || exit 1

echo -e "\033[1;36m═══════════════════════════════════════\033[0m"
echo -e " 💎 Binary ccminer sudah tersedia di repo ini"
echo -e " Apakah kamu ingin compile ulang sesuai CPU?"
echo -e "   [Y] Ya, compile ulang (hapus binary lama)"
echo -e "   [N] Tidak, gunakan precompiled binary"
echo -e "\033[1;36m═══════════════════════════════════════\033[0m"
read -rp " Pilihan kamu (Y/N): " choice

case "$choice" in
    [Yy]*)
        echo -e "\033[1;33m[+] Menghapus binary lama...\033[0m"
        [ -f ccminer ] && rm -f ccminer
        cd CCminer-ARM-optimized || exit 1
        echo -e "\033[1;32m[+] Compile ulang dengan setup.sh...\033[0m"
        ../setup.sh
        ;;
    *)
        echo -e "\033[1;35m[+] Menggunakan precompiled binary...\033[0m"
        ;;
esac