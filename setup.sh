cat > setup.sh <<'EOF'
#!/bin/bash
# ===========================================
#  UNIVERSAL BUILD SCRIPT FOR CCminer ARM
#  By Leafia 💕 untuk sayangku
# ===========================================

set -e

echo -e "\033[1;35m╔══════════════════════════════════════╗"
echo -e "║   💗 CCminer Universal Builder 💗    ║"
echo -e "╚══════════════════════════════════════╝\033[0m"

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
  *A53*)   CFLAGS="-O3 -mcpu=cortex-a53 -mtune=cortex-a53" ;;
  *A55*)   CFLAGS="-O3 -mcpu=cortex-a55 -mtune=cortex-a55" ;;
  *A76*)   CFLAGS="-O3 -mcpu=cortex-a76 -mtune=cortex-a76" ;;
  *Mongoose*|*Exynos*)
           CFLAGS="-O3 -mcpu=exynos-m1 -mtune=exynos-m1" ;;
  *Kryo*)  CFLAGS="-O3 -mcpu=cortex-a75 -mtune=cortex-a75" ;;
  *)       CFLAGS="-O3 -march=armv8-a -mtune=native" ;;
esac

echo -e "\033[1;32m[+] Using compile flags: $CFLAGS\033[0m"

# 5. Patch bug source
echo -e "\033[1;34m[+] Applying patches...\033[0m"

# Fix pthread cancel issue (hapus baris bermasalah di api.cpp)
sed -i 's/.*pthread_setcanceltype.*//g' api.cpp

# Fix endian macros fallback (untuk Termux/Android)
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

echo -e "\033[1;35m╔══════════════════════════════════════╗"
echo -e "║   💕 Build selesai sayangku 💕        ║"
echo -e "║ Binary ada di: ~/pocominer/ccminer   ║"
echo -e "╚══════════════════════════════════════╝\033[0m"
EOF

chmod +x setup.sh