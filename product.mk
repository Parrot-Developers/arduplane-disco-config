CONFIG_DIR := $(call my-dir)

TARGET_LIBC := eglibc
TARGET_ARCH := arm
TARGET_CPU := p7
TARGET_OS_FLAVOUR := parrot

TARGET_CROSS := /opt/arm-2016.02-linaro/bin/arm-linux-gnueabihf-
TARGET_FLOAT_ABI := hard

TARGET_SKEL_DIRS += $(CONFIG_DIR)/skel
