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
LOCAL_PRIVATE_PLATFORM_APIS := true
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/camera/external_camera_config.xml:$(TARGET_COPY_OUT_VENDOR)/etc/external_camera_config.xml

# Doze mode
PRODUCT_PACKAGES += \
    XiaomiDoze

# Overlays
DEVICE_PACKAGE_OVERLAYS += $(LOCAL_PATH)/overlay

# Inherit splitted common product configs
-include $(LOCAL_PATH)/product/*.mk

# Call Samsung LSI Board Support Package
#$(call inherit-product, hardware/samsung_slsi-cm/exynos5/exynos5.mk)
#$(call inherit-product, hardware/samsung_slsi-cm/exynos7870/exynos7870.mk)

# call the common proprietary setup
$(call inherit-product, vendor/samsung/exynos7870-common/exynos7870-common-vendor.mk)
