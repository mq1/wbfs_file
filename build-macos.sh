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
    -Os \
    -arch x86_64 \
    -o wbfs_file-MacOS-x86_64
strip wbfs_file-MacOS-x86_64

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
    -Os \
    -arch arm64 \
    -o wbfs_file-MacOS-arm64
strip wbfs_file-MacOS-arm64

lipo wbfs_file-MacOS-x86_64 wbfs_file-MacOS-arm64 -create -output wbfs_file-MacOS-Universal2
