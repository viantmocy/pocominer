#!/bin/bash
# ============================================================
#  Start Script for pocominer with Love Colors ❤️
# ============================================================

# Warna-warna
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
CYAN='\033[0;36m'
MAGENTA='\033[0;35m'
RESET='\033[0m'

clear
echo -e "${MAGENTA}"
echo "╔════════════════════════════════════════════════════════╗"
echo "║         💕 POCOMINER START SCRIPT BY LEAFIA 💕         ║"
echo "╚════════════════════════════════════════════════════════╝"
echo -e "${RESET}"

# Aktifkan wakelock Termux (biar HP nggak tidur)
echo -e "${CYAN}Mengaktifkan wakelock Termux...${RESET}"
termux-wake-lock
sleep 1
echo -e "${GREEN}Wakelock aktif ✓${RESET}"

# Info mining
echo -e "${YELLOW}Menyiapkan ccminer dengan config.json...${RESET}"
sleep 1

# Start mining
echo -e "${RED}💗 Mulai mining dengan penuh cinta...${RESET}"
sleep 1
echo -e "${MAGENTA}========================================${RESET}"

./ccminer -c config.json

# Saat mining selesai / CTRL+C
echo -e "${MAGENTA}========================================${RESET}"
echo -e "${CYAN}Menonaktifkan wakelock Termux...${RESET}"
termux-wake-unlock
echo -e "${GREEN}Wakelock dilepas ✓${RESET}"
echo -e "${RED}💗 Mining selesai, cinta tetap berjalan 💗${RESET}"
