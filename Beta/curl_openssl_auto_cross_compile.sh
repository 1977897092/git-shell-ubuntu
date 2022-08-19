#! /bin/bash
curl_dir_path="/home/dyj/Share/curl-7.76.1"
openssl_dir_path="/home/dyj/Share/openssl-1.1.1c"
cd $openssl_dir_path
./Configure no-asm shared no-async linux-armv4 --prefix=/home/dyj/Share/openssl/arm_openssl --cross-compile-prefix=arm-oe-linux-gnueabi- --sysroot=/home/dyj/Share/sim_open_sdk/sim_crosscompile/sysroots/mdm9607-perf
make
make install
cd $curl_dir_path
CPPFLAGS="-I/home/dyj/Share/openssl/arm_openssl/include" LDFLAGS="-L/home/dyj/Share/openssl/arm_openssl/lib" LIBS="-ldl" ./configure --host=arm-linux CC="arm-oe-linux-gnueabi-gcc  -march=armv7-a -mfloat-abi=softfp -mfpu=neon --sysroot=/home/dyj/Share/sim_open_sdk/sim_crosscompile/sysroots/mdm9607-perf" CXX=arm-oe-linux-gnueabi-g++ --with-ssl --enable-shared --enable-static --disable-dict --disable-ftp --disable-imap --disable-ldap --disable-ldaps --disable-pop3 --disable-proxy --disable-rtsp --disable-smtp --disable-telnet --disable-tftp --disable-zlib --without-ca-bundle --without-gnutls --without-libidn --without-librtmp --without-libssh2 --without-nss --without-zlib --prefix=/home/dyj/Share/curl/arm_curl
make
make install

