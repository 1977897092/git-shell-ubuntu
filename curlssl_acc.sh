#! /bin/bash
#openssl编译安装相关路径、参数指定
#openssl bin:/home/dyj/Share/openssl/arm_openssl/bin
#curl bin:/home/dyj/Share/curl/arm_curl/bin
#指定openssl的压缩包解压后所在的文件夹
openssl_package_path="/home/dyj/Share/openssl-1.1.1c"
#指定openssl的安装路径
openssl_install_path="/home/dyj/Share/openssl/arm_openssl"
#指定编译链工具（交叉编译 or ?）openssl指定交叉编译器只需要前缀，具体可以看openssl的configure
openssl_compiler="arm-oe-linux-gnueabi-"
#指定编译目标运行平台 openssl似乎只能选这个。具体根据需要修改。arm-linux,X68_64?
openssl_host="linux-armv4"
#编译链工具配置,以下为G5示例
openssl_compiler_sysroot_path="/home/dyj/Share/sim_open_sdk/sim_crosscompile/sysroots/mdm9607-perf"


#curl编译安装相关路径、参数指定
#指定curl的压缩包解压后所在的文件夹
curl_package_path="/home/dyj/Share/curl-7.76.1"
#指定curl的安装路径
curl_install_path="/home/dyj/Share/curl/arm_curl"
#指定编译链工具（交叉编译 or ?）
curl_compiler="arm-oe-linux-gnueabi-gcc  -march=armv7-a -mfloat-abi=softfp -mfpu=neon --sysroot=/home/dyj/Share/sim_open_sdk/sim_crosscompile/sysroots/mdm9607-perf"
#指定编译目标运行平台
curl_host="arm-linux"
#编译链工具配置
curl_compiler_sysroot_path="arm-oe-linux-gnueabi-gcc  -march=armv7-a -mfloat-abi=softfp -mfpu=neon --sysroot=/home/dyj/Share/sim_open_sdk/sim_crosscompile/sysroots/mdm9607-perf"
#opwnssl依赖文件路径
curl_openssl_path=$openssl_install_path

cd $openssl_package_path
./Configure no-asm shared no-async linux-armv4 --prefix=/home/dyj/Share/openssl/arm_openssl --cross-compile-prefix=arm-oe-linux-gnueabi- --sysroot=/home/dyj/Share/sim_open_sdk/sim_crosscompile/sysroots/mdm9607-perf
make
make install
cd $curl_package_path
CPPFLAGS="-I$curl_openssl_path/include" LDFLAGS="-L$curl_openssl_path/lib" LIBS="-ldl" ./configure --host=$curl_host CC=$curl_compiler CXX=arm-oe-linux-gnueabi-g++ --with-ssl --enable-shared --enable-static --disable-dict --disable-ftp --disable-imap --disable-ldap --disable-ldaps --disable-pop3 --disable-proxy --disable-rtsp --disable-smtp --disable-telnet --disable-tftp --disable-zlib --without-ca-bundle --without-gnutls --without-libidn --without-librtmp --without-libssh2 --without-nss --without-zlib --prefix=/home/dyj/Share/curl/arm_curl
make
make install

