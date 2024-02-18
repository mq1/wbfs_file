#!/bin/sh

clang \
    source/wbfs.c \
    source/tools.c \
    source/bn.c \
    source/ec.c \
    source/libwbfs/libwbfs.c \
    source/libwbfs/wiidisc.c \
    source/libwbfs/rijndael.c \
    source/splits.c \
    source/libwbfs/libwbfs_osx.c \
    -I source -I source/libwbfs \
    -DLARGE_FILES -D_FILE_OFFSET_BITS=64 \
    -Oz \
    -arch x86_64 \
    -o wbfs_file-x86_64
strip wbfs_file-x86_64

clang \
    source/wbfs.c \
    source/tools.c \
    source/bn.c \
    source/ec.c \
    source/libwbfs/libwbfs.c \
    source/libwbfs/wiidisc.c \
    source/libwbfs/rijndael.c \
    source/splits.c \
    source/libwbfs/libwbfs_osx.c \
    -I source -I source/libwbfs \
    -DLARGE_FILES -D_FILE_OFFSET_BITS=64 \
    -Oz \
    -arch arm64 \
    -o wbfs_file-arm64
strip wbfs_file-arm64

lipo wbfs_file-x86_64 wbfs_file-arm64 -create -output wbfs_file-Universal2
