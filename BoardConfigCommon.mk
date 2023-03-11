#
# Copyright (C) 2018 The LineageOS Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

LOCAL_PATH := device/samsung/exynos7870-common

# Include headers
TARGET_SPECIFIC_HEADER_PATH := device/samsung/exynos7870-common/include

# Firmware
TARGET_NO_BOOTLOADER := true
TARGET_NO_RADIOIMAGE := true

TARGET_NEEDS_NETD_DIRECT_CONNECT_RULE := true

# Platform
TARGET_BOARD_PLATFORM := exynos5
TARGET_SLSI_VARIANT := cm
TARGET_SOC := exynos7870
TARGET_BOOTLOADER_BOARD_NAME := universal7870

# CPU
TARGET_ARCH := arm
TARGET_ARCH_VARIANT := armv7-a-neon
TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_CPU_VARIANT := generic
TARGET_CPU_CORTEX_A53 := true

# Binder
TARGET_USES_64_BIT_BINDER := true

# Boot animation
TARGET_BOOTANIMATION_PRELOAD := true
TARGET_BOOTANIMATION_TEXTURE_CACHE := true

# HDMI
BOARD_HDMI_INCAPABLE := true

# FIMG2D
BOARD_USES_SKIA_FIMGAPI := true

# (G)SCALER
BOARD_USES_SCALER := true

# Samsung OpenMAX Video
# BOARD_USE_STOREMETADATA := true  -- not working due to invalid buffer handles
BOARD_USE_METADATABUFFERTYPE := true
BOARD_USE_DMA_BUF := true
BOARD_USE_ANB_OUTBUF_SHARE := true
BOARD_USE_IMPROVED_BUFFER := true
BOARD_USE_NON_CACHED_GRAPHICBUFFER := true
BOARD_USE_GSC_RGB_ENCODER := true
BOARD_USE_CSC_HW := false
BOARD_USE_QOS_CTRL := false
BOARD_USE_S3D_SUPPORT := true
BOARD_USE_VP8ENC_SUPPORT := true

# Video scaling issue workaround
TARGET_OMX_LEGACY_RESCALING := true

# Charger
WITH_LINEAGE_CHARGER := false
BOARD_CHARGING_MODE_BOOTING_LPM := /sys/class/power_supply/battery/batt_lp_charging
BOARD_CHARGER_ENABLE_SUSPEND := true
BOARD_CHARGER_SHOW_PERCENTAGE := true
CHARGING_ENABLED_PATH := /sys/class/power_supply/battery/batt_lp_charging
BACKLIGHT_PATH := /sys/class/backlight/panel/brightness

# Filesystems
TARGET_USERIMAGES_USE_EXT4 := true
TARGET_USERIMAGES_USE_F2FS := true

# Extended Filesystem Support
TARGET_EXFAT_DRIVER := sdfat

# Use these flags if the board has a ext4 partition larger than 2gb
BOARD_HAS_LARGE_FILESYSTEM := true

TARGET_USES_MKE2FS := true

# Graphics
USE_OPENGL_RENDERER := true
NUM_FRAMEBUFFER_SURFACE_BUFFERS := 3

# ION
TARGET_USES_ION := true

# Samsung HALs to be built from hardware/samsung
TARGET_AUDIOHAL_VARIANT := samsung
TARGET_POWERHAL_VARIANT := samsung

BUILD_TOP := $(shell pwd)

# Extracted with libbootimg
BOARD_KERNEL_BASE := 0x10000000
BOARD_KERNEL_IMAGE_NAME := Image
BOARD_KERNEL_PAGESIZE := 2048

# Kernel Configs
TARGET_KERNEL_ARCH := arm64
TARGET_KERNEL_HEADER_ARCH := arm
TARGET_KERNEL_CROSS_COMPILE_PREFIX := aarch64-linux-android-
KERNEL_TOOLCHAIN := $(BUILD_TOP)/prebuilts/gcc/$(HOST_OS)-x86/aarch64/aarch64-linux-android-4.9/bin
BOARD_KERNEL_IMAGE_NAME := Image

# Custom mkbootimg from hardware/samsung
BOARD_CUSTOM_BOOTIMG_MK := hardware/samsung/mkbootimg.mk
BOARD_MKBOOTIMG_ARGS := --kernel_offset 0x00008000 --ramdisk_offset 0x01000000 --tags_offset 0x00000100

# Device Tree Blobs
BOARD_KERNEL_SEPARATED_DT := true
TARGET_CUSTOM_DTBTOOL := dtbhtoolExynos

# Samsung Hardware
#BOARD_HARDWARE_CLASS := device/samsung/exynos7870-common/lineagehw

JAVA_SOURCE_OVERLAYS := \
    org.lineageos.hardware|hardware/samsung/lineagehw|**/*.java \
    org.lineageos.hardware|$(LOCAL_PATH)/lineagehw|**/*.java

# RIL
BOARD_VENDOR := samsung
BOARD_MODEM_TYPE := tss310
BOARD_PROVIDES_LIBRIL := true

# Recovery
BOARD_HAS_DOWNLOAD_MODE := true
TARGET_RECOVERY_FSTAB := $(LOCAL_PATH)/ramdisk/fstab.samsungexynos7870

# TWRP
# RECOVERY_VARIANT := twrp
ifeq ($(RECOVERY_VARIANT),twrp)
RECOVERY_GRAPHICS_USE_LINELENGTH := true
TW_THEME := portrait_hdpi
TARGET_RECOVERY_PIXEL_FORMAT := "ABGR_8888"
TW_BRIGHTNESS_PATH := "/sys/class/backlight/panel/brightness"
TW_MAX_BRIGHTNESS := 255
TW_NO_REBOOT_BOOTLOADER := true
TW_INCLUDE_CRYPTO := true
TW_INCLUDE_NTFS_3G := true
TW_HAS_DOWNLOAD_MODE := true
TW_NO_EXFAT_FUSE := true
TW_EXCLUDE_SUPERSU := true
TARGET_USE_CUSTOM_LUN_FILE_PATH := "/sys/class/android_usb/android0/f_mass_storage/lun/file"
endif

# Shim
TARGET_LD_SHIM_LIBS += \
    /system/lib/libcamera_client.so|/vendor/lib/libcamera_client_shim.so \
    /system/lib/libstagefright.so|/vendor/lib/libstagefright_shim.so \
    /system/lib/libexynoscamera.so|/vendor/lib/libexynoscamera_shim.so

# Shim-OMX
TARGET_LD_SHIM_LIBS += \
    /system/lib/libexynoscamera.so|/vendor/lib/libstagefright_shim.so \
    /system/lib/libexynoscamera3.so|/vendor/lib/libstagefright_shim.so \
    /system/lib/omx/libOMX.Exynos.AVC.Decoder.so|/vendor/lib/libui_shim.so \
    /system/lib/omx/libOMX.Exynos.AVC.Encoder.so|/vendor/lib/libui_shim.so \
    /system/lib/omx/libOMX.Exynos.HEVC.Decoder.so|/vendor/lib/libui_shim.so \
    /system/lib/omx/libOMX.Exynos.HEVC.Encoder.so|/vendor/lib/libui_shim.so \
    /system/lib/omx/libOMX.Exynos.MPEG4.Decoder.so|/vendor/lib/libui_shim.so \
    /system/lib/omx/libOMX.Exynos.MPEG4.Encoder.so|/vendor/lib/libui_shim.so \
    /system/lib/omx/libOMX.Exynos.VP8.Decoder.so|/vendor/lib/libui_shim.so \
    /system/lib/omx/libOMX.Exynos.VP8.Encoder.so|/vendor/lib/libui_shim.so \
    /system/lib/omx/libOMX.Exynos.VP9.Decoder.so|/vendor/lib/libui_shim.so \
    /system/lib/omx/libOMX.Exynos.WMV.Decoder.so|/vendor/lib/libui_shim.so \
    /system/lib/omx/libOMX.Exynos.AVC.Decoder.so|/vendor/lib/libstagefright_shim.so \
    /system/lib/omx/libOMX.Exynos.AVC.Encoder.so|/vendor/lib/libstagefright_shim.so \
    /system/lib/omx/libOMX.Exynos.HEVC.Decoder.so|/vendor/lib/libstagefright_shim.so \
    /system/lib/omx/libOMX.Exynos.HEVC.Encoder.so|/vendor/lib/libstagefright_shim.so \
    /system/lib/omx/libOMX.Exynos.MPEG4.Decoder.so|/vendor/lib/libstagefright_shim.so \
    /system/lib/omx/libOMX.Exynos.MPEG4.Encoder.so|/vendor/lib/libstagefright_shim.so \
    /system/lib/omx/libOMX.Exynos.VP8.Decoder.so|/vendor/lib/libstagefright_shim.so \
    /system/lib/omx/libOMX.Exynos.VP8.Encoder.so|/vendor/lib/libstagefright_shim.so \
    /system/lib/omx/libOMX.Exynos.VP9.Decoder.so|/vendor/lib/libstagefright_shim.so \
    /system/lib/omx/libOMX.Exynos.WMV.Decoder.so|/vendor/lib/libstagefright_shim.so

TARGET_PROCESS_SDK_VERSION_OVERRIDE += \
    /system/bin/mediaserver=24 \
    /system/vendor/bin/hw/rild=27

# SELinux
BOARD_SEPOLICY_DIRS += device/samsung/exynos7870-common/sepolicy
VENDOR_SECURITY_PATCH := 2018-11-01

TARGET_OMIT_NETD_TETHER_FTP_HELPER := true

# selinux
SELINUX_IGNORE_NEVERALLOWS := true

# Properties
TARGET_SYSTEM_PROP := $(LOCAL_PATH)/system.prop

# HWComposer Inherit splitted common board configs
TARGET_HWC2_NO_SKIPVALIDATE := true
