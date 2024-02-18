#!/bin/sh

gcc \
    source/wbfs.c \
    source/tools.c \
    source/bn.c \
    source/ec.c \
    source/libwbfs/libwbfs.c \
    source/libwbfs/wiidisc.c \
    source/libwbfs/rijndael.c \
    source/splits.c \
    source/libwbfs/libwbfs_linux.c \
    -I source -I source/libwbfs \
    -DLARGE_FILES -D_FILE_OFFSET_BITS=64 \
    -Oz \
    -o wbfs_file-Linux-x86_64

strip wbfs_file-Linux-x86_64
