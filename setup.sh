#!/bin/bash
# ===========================================
#  UNIVERSAL BUILD SCRIPT FOR CCminer ARM
#  By Leafia 💕 untuk sayangku
# ===========================================

set -e

# Fungsi untuk cetak kotak dinamis
print_box() {
    local text="$1"
    local color="${2:-35}"  # default ungu
    local padding=2

    # Hitung panjang teks tanpa escape sequence
    local clean_text=$(echo -e "$text" | sed 's/\x1b\[[0-9;]*m//g')
    local len=${#clean_text}
    local width=$((len + padding * 2))

    # Buat garis atas
    printf "\033[1;%sm╔%0.s═" "$color" $(seq 1 $width)
    echo "╗"

    # Tulis teks dengan padding
    printf "\033[1;%sm║%*s%s%*s║\033[0m\n" "$color" "$padding" "" "$text" "$padding" ""

    # Buat garis bawah
    printf "\033[1;%sm╚%0.s═" "$color" $(seq 1 $width)
    echo "╝\033[0m"
}

# ===============================
# Header
# ===============================
print_box "💗 CCminer Universal Builder 💗"

# 1. Install dependencies
echo -e "\033[1;33m[+] Installing build tools...\033[0m"
pkg update -y
pkg install -y git build-essential automake autoconf \
    libtool pkg-config cmake clang

# 2. Clone repo (hapus lama kalau ada)
cd ~
[ -d CCminer-ARM-optimized ] && rm -rf CCminer-ARM-optimized
git clone https://github.com/Oink70/CCminer-ARM-optimized
cd CCminer-ARM-optimized

# 3. Deteksi CPU
CPU=$(lscpu | grep "Model name" | head -n1 | awk '{print $3$4$5}')
echo -e "\033[1;36m[+] Detected CPU: $CPU\033[0m"

# 4. Tentukan flag compile
case "$CPU" in
  *A53*)       CFLAGS="-O3 -mcpu=cortex-a53 -mtune=cortex-a53" ;;
  *A55*)       CFLAGS="-O3 -mcpu=cortex-a55 -mtune=cortex-a55" ;;
  *A76*)       CFLAGS="-O3 -mcpu=cortex-a76 -mtune=cortex-a76" ;;
  *Mongoose*|*Exynos*) CFLAGS="-O3 -mcpu=exynos-m1 -mtune=exynos-m1" ;;
  *Kryo*)      CFLAGS="-O3 -mcpu=cortex-a75 -mtune=cortex-a75" ;;
  *)           CFLAGS="-O3 -march=armv8-a -mtune=native" ;;
esac

echo -e "\033[1;32m[+] Using compile flags: $CFLAGS\033[0m"

# 5. Patch bug source
echo -e "\033[1;34m[+] Applying patches...\033[0m"
sed -i 's/.*pthread_setcanceltype.*//g' api.cpp

if ! grep -q "LE_ENDIAN_FIX" serialize.hpp; then
cat <<'PATCH' | sed -i '1r /dev/stdin' serialize.hpp
// ====== LE_ENDIAN_FIX (Termux/Android) ======
#ifndef LE_ENDIAN_FIX
#define LE_ENDIAN_FIX

#include <stdint.h>

#ifndef htole16
#define htole16(x) ((uint16_t)(x))
#endif
#ifndef htole32
#define htole32(x) ((uint32_t)(x))
#endif
#ifndef htole64
#define htole64(x) ((uint64_t)(x))
#endif

#ifndef le16toh
#define le16toh(x) ((uint16_t)(x))
#endif
#ifndef le32toh
#define le32toh(x) ((uint32_t)(x))
#endif
#ifndef le64toh
#define le64toh(x) ((uint64_t)(x))
#endif

#endif // LE_ENDIAN_FIX
// ============================================
PATCH
fi

# 6. Build
./build.sh clean || true
./autogen.sh
CFLAGS="$CFLAGS" CXXFLAGS="$CFLAGS" ./configure CXX=clang++ CC=clang --with-curl
make -j$(nproc)

# 7. Simpan binary ke ~/pocominer
mkdir -p ~/pocominer
cp ccminer ~/pocominer/

# ===============================
# Hapus sisa-sisa source
# ===============================
cd ~
rm -rf CCminer-ARM-optimized

# ===============================
# Footer
# ===============================
print_box "💕 Build selesai sayangku 💕" 35
echo -e "\033[1;32mBinary ada di: ~/pocominer/ccminer\033[0m"