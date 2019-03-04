#!/bin/sh

chmod +x configure
chmod +x version.sh

#SYSROOT=$NDK/platforms/android-14/arch-arm  
#TOOLCHAIN=$NDK/toolchains/arm-linux-androideabi-4.9/prebuilt/linux-x86_64
#--cross-prefix=$TOOLCHAIN/bin/arm-linux-androideabi- 

SYSROOT=$CVR_SDK_ROOT/prebuilts/toolschain/usr/arm-rkcvr-linux-uclibcgnueabihf/sysroot
TOOLCHAIN=$CVR_SDK_ROOT/prebuilts/toolschain/usr
#--cross-prefix=$TOOLCHAIN/bin/arm-linux- 

./configure --prefix=../ffmpeg/ffmpeg-2.8.3/build \
--disable-yasm --disable-everything --disable-programs --disable-doc --disable-debug \
--enable-small --enable-gpl --enable-libx264 \
--enable-cross-compile --arch=arm --target-os=linux \
--cross-prefix=$TOOLCHAIN/bin/arm-linux- \
--sysroot=$SYSROOT \
--enable-protocol=file \
--enable-demuxer=mov --enable-demuxer=h264 --enable-demuxer=rawvideo \
--enable-decoder=h264 --enable-parser=h264 \
--enable-encoder=libx264 --enable-encoder=rawvideo \
--enable-muxer=mp4 --enable-muxer=rawvideo \
--extra-cflags="-I/home/liu/software/x264_build/include" \
--extra-ldflags="-L/home/liu/software/x264_build/lib -ldl"

