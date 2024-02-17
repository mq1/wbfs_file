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
    -o wbfs_file

strip wbfs_file
