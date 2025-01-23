# Copyright (C) 2016 The CyanogenMod Project
# Copyright (C) 2019 The OmniRom Project
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
# This file is the build configuration for a full Android
# build for grouper hardware. This cleanly combines a set of
# device-specific aspects (drivers) with a device-agnostic
# product configuration (apps).
#

# Inherit from common AOSP config
$(call inherit-product, $(SRC_TARGET_DIR)/product/base.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit_only.mk)

# Enable project quotas and casefolding for emulated storage without sdcardfs
$(call inherit-product, $(SRC_TARGET_DIR)/product/emulated_storage.mk)

# Installs gsi keys into ramdisk, to boot a GSI with verified boot.
$(call inherit-product, $(SRC_TARGET_DIR)/product/gsi_keys.mk)

# Platform
QCOM_BOARD_PLATFORMS += $(PRODUCT_PLATFORM)
TARGET_BOARD_PLATFORM := $(PRODUCT_PLATFORM)
TARGET_BOOTLOADER_BOARD_NAME := $(TARGET_BOARD_PLATFORM)

BUILD_BROKEN_DUP_RULES := true

RELAX_USES_LIBRARY_CHECK := true

# A/B support
AB_OTA_UPDATER := true

# VNDK
PRODUCT_TARGET_VNDK_VERSION := 32

# Virtual A/B
$(call inherit-product, $(SRC_TARGET_DIR)/product/virtual_ab_ota.mk)

# A/B updater updatable partitions list. Keep in sync with the partition list
# with "_a" and "_b" variants in the device. Note that the vendor can add more
# more partitions to this list for the bootloader and radio.

# Main Logical Partitions
AB_OTA_PARTITIONS += \
    abl \
    aop \
    aop_config \
    bluetooth \
    boot \
    cpucp \
    cpucp_dtb \
    devcfg \
    dsp \
    dtbo \
    engineering_cdt \
    featenabler \
    hyp \
    imagefv \
    init_boot \
    keymaster \
    modem \
    my_bigball \
    my_carrier \
    my_company \
    my_engineering \
    my_heytap \
    my_manifest \
    my_preload \
    my_product \
    my_region \
    my_stock \
    odm \
    oplus_sec \
    oplusstanvbk \
    product \
    qupfw \
    recovery \
    shrm \
    splash \
    system \
    system_dlkm \
    system_ext \
    tz \
    uefi \
    uefisecapp \
    vbmeta \
    vbmeta_system \
    vbmeta_vendor \
    vendor \
    vendor_boot \
    vendor_dlkm \
    xbl \
    xbl_config \
    xbl_ramdump

# A/B related packages

PRODUCT_PACKAGES += update_engine \
    update_engine_client \
    update_verifier \
    android.hardware.boot@1.2-impl-qti \
    android.hardware.boot@1.2-impl-qti.recovery \
    android.hardware.boot@1.2-service

PRODUCT_PACKAGES += \
  update_engine_sideload

PRODUCT_VENDOR_PROPERTIES += \
  external_storage.projid.enabled=1
  external_storage.casefold.enabled=1
  external_storage.sdcardfs.enabled=0
  keyguard.no_require_sim=true
  ro.com.android.dataroaming=true
  ro.config.ringtone=Ring_Synth_04.ogg
  # Removed by post_process_props.py because overridden by ro.config.notification_sound?=OnTheHunt.ogg
  #ro.config.notification_sound?=pixiedust.ogg
  # Removed by post_process_props.py because overridden by ro.zygote=zygote64
  #ro.zygote?=zygote32
  tombstoned.max_tombstone_count=50
  ro.logd.size.stats=64K
  log.tag.stats_log=I
  ro.carrier=unknown
  ro.config.notification_sound=OnTheHunt.ogg
  ro.config.alarm_alert=Alarm_Classic.ogg
  ro.zygote=zygote64
  ro.virtual_ab.enabled=true
  ro.virtual_ab.compression.enabled=true

# f2fs utilities
PRODUCT_PACKAGES += \
    sg_write_buffer \
    f2fs_io \
    check_f2fs

# Userdata checkpoint
PRODUCT_PACKAGES += \
    checkpoint_gc

AB_OTA_POSTINSTALL_CONFIG += \
    RUN_POSTINSTALL_vendor=true \
    POSTINSTALL_PATH_vendor=bin/checkpoint_gc \
    FILESYSTEM_TYPE_vendor=ext4 \
    POSTINSTALL_OPTIONAL_vendor=true

# Set GRF/Vendor freeze properties
BOARD_SHIPPING_API_LEVEL := 32
BOARD_API_LEVEL := 32
SHIPPING_API_LEVEL := 32
PRODUCT_SHIPPING_API_LEVEL := 32

#Support to compile recovery without msm headers
TARGET_HAS_GENERIC_KERNEL_HEADERS := true

# Dynamic partitions
PRODUCT_USE_DYNAMIC_PARTITIONS := true

# fastbootd
PRODUCT_PACKAGES += fastbootd

# Add default implementation of fastboot HAL.
PRODUCT_PACKAGES += android.hardware.boot@1.0-impl-1.2-qti
PRODUCT_PACKAGES += android.hardware.fastboot@1.1-impl-mock
PRODUCT_PACKAGES += android.hardware.gatekeeper@1.0-impl-qti
PRODUCT_PACKAGES += android.hardware.health@2.0-impl-2.1
PRODUCT_PACKAGES += android.hardware.health@2.0-impl-default
PRODUCT_PACKAGES += libEseUtils
PRODUCT_PACKAGES += libqtigatekeeper
PRODUCT_PACKAGES += vibrator.default

# qcom decryption
PRODUCT_PACKAGES += \
    qcom_decrypt \
    qcom_decrypt_fbe

# Soong namespaces
PRODUCT_SOONG_NAMESPACES += \
    $(DEVICE_PATH)

#namespace definition for librecovery_updater
#differentiate legacy 'sg' or 'bsg' framework
SOONG_CONFIG_NAMESPACES += ufsbsg

SOONG_CONFIG_ufsbsg += ufsframework
SOONG_CONFIG_ufsbsg_ufsframework := bsg

# OEM otacerts
PRODUCT_EXTRA_RECOVERY_KEYS += \
    $(DEVICE_PATH)/security/otacert


# Copy modules for depmod
PRODUCT_COPY_FILES += $(call find-copy-subdir-files,*.ko,$(DEVICE_PATH)/twrp/recovery/root/vendor/lib/modules,$(TARGET_COPY_OUT_RECOVERY)/root/vendor/lib/modules)

# System AVB
BOARD_AVB_VBMETA_SYSTEM := system
BOARD_AVB_VBMETA_SYSTEM_KEY_PATH := external/avb/test/data/testkey_rsa2048.pem
BOARD_AVB_VBMETA_SYSTEM_ALGORITHM := SHA256_RSA2048
BOARD_AVB_VBMETA_SYSTEM_ROLLBACK_INDEX := $(PLATFORM_SECURITY_PATCH_TIMESTAMP)
BOARD_AVB_VBMETA_SYSTEM_ROLLBACK_INDEX_LOCATION := 2

# Touchscreen
persist.vendor.qti.inputopts.enable=true
persist.vendor.qti.inputopts.movetouchslop=0.6

# Enable Fuse Passthrough
PRODUCT_PROPERTY_OVERRIDES += persist.sys.fuse.passthrough.enable=true

TARGET_RECOVERY_DEVICE_DIRS += $(DEVICE_PATH)/twrp
