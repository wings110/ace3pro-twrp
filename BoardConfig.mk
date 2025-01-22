#
# Copyright 2017 The Android Open Source Project
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

# This contains the module build definitions for the hardware-specific
# components for this device.
#
# As much as possible, those components should be built unconditionally,
# with device-specific names to avoid collisions, to avoid device-specific
# bitrot and build breakages. Building a component unconditionally does
# *not* include it on all devices, so it is safe even with hardware-specific
# components.

DEVICE_PATH := device/oneplus/corvette

# SDK
BOARD_SYSTEMSDK_VERSIONS := 32

# Architecture
TARGET_ARCH := arm64
TARGET_ARCH_VARIANT := armv8-a-branchprot
TARGET_CPU_ABI := arm64-v8a
TARGET_CPU_ABI2 :=
TARGET_CPU_VARIANT := kryo385
TARGET_2ND_ARCH := arm
TARGET_2ND_ARCH_VARIANT := armv8-2a
TARGET_2ND_CPU_ABI := armeabi-v7a
TARGET_2ND_CPU_ABI2 := armeabi
TARGET_2ND_CPU_VARIANT := cortex-a75
ALLOW_MISSING_DEPENDENCIES := true

# Bootloader
BOARD_VENDOR := OnePlus
TARGET_NO_BOOTLOADER := true
TARGET_USES_UEFI := true
TARGET_USES_REMOTEPROC := true

# Kernel/Ramdisk
BOARD_BOOT_HEADER_VERSION := 4
BOARD_MKBOOTIMG_ARGS := --header_version $(BOARD_BOOT_HEADER_VERSION)
BOARD_EXCLUDE_KERNEL_FROM_RECOVERY_IMAGE := true
BOARD_KERNEL_IMAGE_NAME := kernel
BOARD_RAMDISK_USE_LZ4 := true
TARGET_PREBUILT_KERNEL := $(DEVICE_PATH)/prebuilt/$(BOARD_KERNEL_IMAGE_NAME)

# Partition Info
BOARD_PROPERTY_OVERRIDES_SPLIT_ENABLED := true

TARGET_COPY_OUT_ODM := odm
BOARD_ODMIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_USES_VENDOR_DLKMIMAGE := true
TARGET_COPY_OUT_VENDOR_DLKM := vendor_dlkm
BOARD_VENDOR_DLKMIMAGE_FILE_SYSTEM_TYPE := ext4

TARGET_USERIMAGES_USE_EXT4 := true
TARGET_USERIMAGES_USE_F2FS := true
BOARD_SYSTEMIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_USERDATAIMAGE_FILE_SYSTEM_TYPE := f2fs
BOARD_BOOTIMAGE_PARTITION_SIZE := 201326592
BOARD_KERNEL-GKI_BOOTIMAGE_PARTITION_SIZE := $(BOARD_BOOTIMAGE_PARTITION_SIZE)
BOARD_VENDOR_BOOTIMAGE_PARTITION_SIZE := 201326592
BOARD_USERDATAIMAGE_PARTITION_SIZE := 233871900672
BOARD_PERSISTIMAGE_PARTITION_SIZE := 67108864
BOARD_PERSISTIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_METADATAIMAGE_PARTITION_SIZE := 16777216
BOARD_DTBOIMG_PARTITION_SIZE := 25165824
BOARD_VENDORIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_FLASH_BLOCK_SIZE := 262144 # (BOARD_KERNEL_PAGESIZE * 64)

# Dynamic/Logical Partitions
BOARD_SUPER_PARTITION_SIZE := 16642998272
BOARD_SUPER_PARTITION_GROUPS := qti_dynamic_partitions
BOARD_QTI_DYNAMIC_PARTITIONS_SIZE := 16642998268 # BOARD_SUPER_PARTITION_SIZE - 4MB
BOARD_QTI_DYNAMIC_PARTITIONS_PARTITION_LIST := odm product system system_ext vendor vendor_dlkm

BOARD_RECOVERYIMAGE_PARTITION_SIZE := 104857600

# Workaround for error copying vendor files to recovery ramdisk
TARGET_COPY_OUT_VENDOR := vendor

# OTA
TARGET_OTA_ASSERT_DEVICE := corvette

# Rules
BUILD_BROKEN_DUP_RULES := true
BUILD_BROKEN_ELF_PREBUILT_PRODUCT_COPY_FILES := true
BUILD_BROKEN_NINJA_USES_ENV_VARS += RTIC_MPGEN

# KEYSTONE(If43215c7f384f24e7adeeabdbbb1790f174b2ec1,b/147756744)
BUILD_BROKEN_NINJA_USES_ENV_VARS += SDCLANG_AE_CONFIG SDCLANG_CONFIG SDCLANG_SA_ENABLE

BUILD_BROKEN_USES_BUILD_HOST_SHARED_LIBRARY := true
BUILD_BROKEN_USES_BUILD_HOST_STATIC_LIBRARY := true
BUILD_BROKEN_USES_BUILD_HOST_EXECUTABLE := true
BUILD_BROKEN_USES_BUILD_COPY_HEADERS := true

# Recovery
TARGET_RECOVERY_DEVICE_MODULES += \
    libprocessgroup_setup \
    libidl \
    vendor.display.config@2.0 \
    liboplusvibratoreffect \
    libcppcose_rkp \
    android.hardware.security.keymint-V1-ndk \
    libdrm \
    android.hardware.keymaster@4.0 \
    libqtigatekeeper \
    libqtikeymaster4 \
    libnetutils \
    libjc_keymint_nxp \
    libGPreqcancel \
    libkeystore2_crypto \
    libboot_control_qti \
    libcrypto \
    libkeystore-wifi-hidl \
    libprocessgroup \
    libcppbor \
    android.frameworks.stats-V1-ndk_platform \
    android.hardware.secure_element@1.0 \
    libf2fs_sparseblock \
    libmtdutils \
    libGPTEE_vendor \
    libspcom \
    android.hardware.oemlock@1.0 \
    libft2 \
    android.hardware.health@1.0 \
    librecovery_updater \
    libcppbor_external \
    libkeystore2_vintf_cpp \
    libjc_keymint_transport_nxp \
    libusbhost \
    librecovery_updater_msm \
    libnos_datagram \
    libext2_com_err \
    libext2_misc \
    libkeymasterutils \
    libhardware_legacy \
    libqtikeymint \
    android.hidl.memory.token@1.0 \
    libdl \
    libkeymint \
    libkm_compat_service \
    libfs_mgr \
    android.hardware.secure_element@1.2 \
    android.hardware.boot@1.0 \
    libasyncio \
    android.security.authorization-ndk_platform \
    libchrome \
    libkeymaster4support \
    libutils \
    libkeymaster4_1support \
    libqdutils \
    libsoftkeymasterdevice \
    libspl \
    libnos_transport \
    android.frameworks.stats@1.0 \
    android.hardware.health-V1-ndk \
    libutilscallstack \
    libpcre2 \
    libkeystore2_aaid \
    libincfs \
    libkeymaster_portable \
    libsivibrator \
    libdmabufheap \
    libkm_compat \
    libext2_quota \
    android.hardware.vibrator@1.2 \
    libgsi \
    libext2_uuid \
    android.hardware.keymaster@3.0 \
    libstdc++ \
    android.security.maintenance-ndk_platform \
    libc \
    libgatekeeper \
    libandroid_runtime_lazy \
    libext2_blkid \
    libext4_utils \
    libsync \
    android.hardware.confirmationui@1.0 \
    libpuresoftkeymasterdevice \
    libkeystore-attestation-application-id \
    libhidlmemory \
    libselinux \
    android.hardware.vibrator-V1-ndk_platform \
    android.hardware.vibrator@1.0 \
    libhwbinder \
    android.hardware.security.rkp-V3-ndk \
    libsysutils \
    libbmlutils \
    android.hardware.fastboot@1.0 \
    liblog \
    libxml2 \
    libandroidicu \
    vendor.aac.hardware.richtap.vibrator-V2-ndk \
    libtinyxml2 \
    libdiag \
    libz \
    libvndksupport \
    libziparchive \
    libclang_rt.ubsan_standalone-aarch64-android \
    ld-android \
    android.hardware.keymaster-V3-ndk \
    libtwadbbu \
    libutil-linux \
    android.security.apc-ndk_platform \
    libdrmutils \
    libkeymasterdeviceutils \
    android.system.suspend@1.0 \
    android.system.keystore2-V1-ndk \
    libssl \
    libcrypto_utils \
    android.hardware.security.keymint-V1-ndk_platform \
    android.hardware.security.keymint-V1-cpp \
    libcap \
    android.hidl.memory@1.0 \
    liblogwrap \
    android.hardware.authsecret@1.0 \
    libbacktrace \
    libhardware \
    libadbd_auth \
    libhidltransport \
    libops \
    libdisplayconfig.qti \
    libtfavib \
    android.security.compat-ndk_platform \
    libsoft_attestation_cert \
    android.hardware.security.sharedsecret-V1-ndk \
    libqcbor \
    android.hardware.weaver@1.0 \
    libnetd_client \
    vendor.oplus.hardware.oplusvibrator-V1-ndk \
    liblz4 \
    libfec \
    android.hardware.keymaster@4.1 \
    libgatekeeper_aidl \
    android.hardware.security.secureclock-V1-cpp \
    android.hardware.security.sharedsecret-V1-ndk_platform \
    android.system.keystore2-V1-ndk_platform \
    android.hardware.boot-V1-ndk \
    libcutils \
    libncurses \
    libc++ \
    libhidl-gen-utils \
    libQSEEComAPI \
    lib_android_keymaster_keymint_utils \
    liblp \
    libion \
    libbinder \
    libaacvibrator \
    libssd \
    libmmcutils \
    android.hardware.health-V2-ndk \
    android.hardware.boot@1.1 \
    libkeystore-engine-wifi-hidl \
    android.hardware.vibrator@1.1 \
    android.hardware.health@2.0 \
    android.hardware.secure_element@1.1 \
    libpng \
    libadb_protos \
    libresetprop \
    libext2fs \
    vendor.display.config@1.0 \
    libservices \
    libsquashfs_utils \
    libnl \
    libkeymint_support \
    android.hardware.gatekeeper@1.0 \
    libGPreqcancel_svc \
    android.hardware.health@2.1 \
    libhidlbase \
    libkeystoreinfo \
    android.hardware.vibrator-V2-cpp \
    libtime_genoff \
    libext2_e2p \
    libjsoncpp \
    android.hardware.gatekeeper-V1-ndk \
    vendor.oplus.hardware.vibrator-V1-ndk \
    libdiskconfig \
    libgpt \
    libprotobuf-cpp-lite \
    libkeyutils \
    libicuuc \
    libadbd_fs \
    android.hidl.allocator@1.0 \
    android.hidl.token@1.0 \
    android.hardware.boot@1.2 \
    libbase \
    libvintf \
    libsparse \
    libbootloader_message \
    libsqlite \
    libsoc_helper_jni \
    android.hardware.vibrator-V2-ndk_platform \
    libssh \
    libcgrouprc \
    libm \
    libunwindstack \
    android.hardware.security.secureclock-V1-ndk_platform \
    android.hardware.secure_element-V1-ndk \
    libvmmem \
    libqisl \
    libdrmfs \
    libkeystore2_apc_compat \
    android.hardware.fastboot@1.1 \
    android.se.omapi-V1-ndk \
    android.hardware.vibrator-V1-cpp \
    libsoc_helper \
    libblkid \
    liblzma \
    libprocinfo \
    libntfs-3g \
    librpmb \
    libminkdescriptor \
    libmemunreachable \
    android.hardware.security.keymint-V2-ndk \
    libqservice \
    android.system.wifi.keystore@1.0 \
    libfuse-lite \
    android.hardware.health.storage@1.0 \
    android.hardware.security.keymint-V3-ndk \
    libdrmtime \
    libkeymaster_messages \
    libpackagelistparser \
    libfusesideload \
    libevent \
    android.hardware.security.secureclock-V1-ndk \
    libbinder_ndk \
    libdl_android \
    libGPQeSE \
    libkeymasterprovision \
    libtar \
    android.hardware.health.storage-V1-ndk_platform \
    libflashutils
TARGET_RECOVERY_FSTAB := $(DEVICE_PATH)/recovery.fstab

# Theme
TW_Y_OFFSET := 124
TW_H_OFFSET := -124

# Use mke2fs to create ext4 images
TARGET_USES_MKE2FS := true

# AVB
BOARD_AVB_ENABLE := true
BOARD_AVB_RECOVERY_KEY_PATH := external/avb/test/data/testkey_rsa4096.pem
BOARD_AVB_RECOVERY_ALGORITHM := SHA256_RSA4096
BOARD_AVB_RECOVERY_ROLLBACK_INDEX := 1
BOARD_AVB_RECOVERY_ROLLBACK_INDEX_LOCATION := 1

# Encryption
BOARD_USES_METADATA_PARTITION := true
BOARD_USES_QCOM_FBE_DECRYPTION := true
PLATFORM_VERSION := 16.1.0
PLATFORM_VERSION_LAST_STABLE := $(PLATFORM_VERSION)
PLATFORM_SECURITY_PATCH := 2099-12-31
VENDOR_SECURITY_PATCH := $(PLATFORM_SECURITY_PATCH)

# Extras
TARGET_SYSTEM_PROP += $(DEVICE_PATH)/system.prop
# TARGET_VENDOR_PROP += $(DEVICE_PATH)/vendor.prop

# Vibrator
TW_SUPPORT_INPUT_AIDL_HAPTICS := true
TW_SUPPORT_INPUT_AIDL_HAPTICS_FIX_OFF := true

# TWRP specific build flags
TARGET_RECOVERY_QCOM_RTC_FIX := true
TARGET_RECOVERY_PIXEL_FORMAT := RGBX_8888
TW_FRAMERATE := 120
TW_THEME := portrait_hdpi
TW_CUSTOM_CPU_TEMP_PATH := "/sys/devices/virtual/thermal/thermal_zone45/temp"
TW_BRIGHTNESS_PATH := "/sys/devices/platform/soc/ae00000.qcom,mdss_mdp/backlight/panel0-backlight/brightness"
TW_MAX_BRIGHTNESS := 36500
TW_DEFAULT_BRIGHTNESS := 15000
TW_STATUS_ICONS_ALIGN := center
TW_QCOM_ATS_OFFSET := 1666528204500
TW_EXCLUDE_APEX := true
TW_EXCLUDE_DEFAULT_USB_INIT := true
TW_EXTRA_LANGUAGES := true
TW_INCLUDE_CRYPTO := true
TW_NO_EXFAT_FUSE := true
TW_INCLUDE_RESETPROP := true
TW_USE_SERIALNO_PROPERTY_FOR_DEVICE_ID := true
TW_SCREEN_BLANK_ON_BOOT := true
TW_OVERRIDE_SYSTEM_PROPS := \
    "ro.build.product;ro.build.fingerprint=ro.vendor.build.fingerprint;ro.build.version.incremental"
TW_OVERRIDE_PROPS_ADDITIONAL_PARTITIONS := vendor
RECOVERY_LIBRARY_SOURCE_FILES += \
    $(TARGET_OUT_SHARED_LIBRARIES)/libprocessgroup_setup.so \
    $(TARGET_OUT_SHARED_LIBRARIES)/libidl.so \
    $(TARGET_OUT_SHARED_LIBRARIES)/vendor.display.config@2.0.so \
    $(TARGET_OUT_SHARED_LIBRARIES)/liboplusvibratoreffect.so \
    $(TARGET_OUT_SHARED_LIBRARIES)/libcppcose_rkp.so \
    $(TARGET_OUT_SHARED_LIBRARIES)/android.hardware.security.keymint-V1-ndk.so \
    $(TARGET_OUT_SHARED_LIBRARIES)/libdrm.so \
    $(TARGET_OUT_SHARED_LIBRARIES)/android.hardware.keymaster@4.0.so \
    $(TARGET_OUT_SHARED_LIBRARIES)/libqtigatekeeper.so \
    $(TARGET_OUT_SHARED_LIBRARIES)/libqtikeymaster4.so \
    $(TARGET_OUT_SHARED_LIBRARIES)/libnetutils.so \
    $(TARGET_OUT_SHARED_LIBRARIES)/libjc_keymint_nxp.so \
    $(TARGET_OUT_SHARED_LIBRARIES)/libGPreqcancel.so \
    $(TARGET_OUT_SHARED_LIBRARIES)/libkeystore2_crypto.so \
    $(TARGET_OUT_SHARED_LIBRARIES)/libboot_control_qti.so \
    $(TARGET_OUT_SHARED_LIBRARIES)/libcrypto.so \
    $(TARGET_OUT_SHARED_LIBRARIES)/libkeystore-wifi-hidl.so \
    $(TARGET_OUT_SHARED_LIBRARIES)/libprocessgroup.so \
    $(TARGET_OUT_SHARED_LIBRARIES)/libcppbor.so \
    $(TARGET_OUT_SHARED_LIBRARIES)/android.frameworks.stats-V1-ndk_platform.so \
    $(TARGET_OUT_SHARED_LIBRARIES)/android.hardware.secure_element@1.0.so \
    $(TARGET_OUT_SHARED_LIBRARIES)/libf2fs_sparseblock.so \
    $(TARGET_OUT_SHARED_LIBRARIES)/libmtdutils.so \
    $(TARGET_OUT_SHARED_LIBRARIES)/libGPTEE_vendor.so \
    $(TARGET_OUT_SHARED_LIBRARIES)/libspcom.so \
    $(TARGET_OUT_SHARED_LIBRARIES)/android.hardware.oemlock@1.0.so \
    $(TARGET_OUT_SHARED_LIBRARIES)/libft2.so \
    $(TARGET_OUT_SHARED_LIBRARIES)/android.hardware.health@1.0.so \
    $(TARGET_OUT_SHARED_LIBRARIES)/librecovery_updater.so \
    $(TARGET_OUT_SHARED_LIBRARIES)/libcppbor_external.so \
    $(TARGET_OUT_SHARED_LIBRARIES)/libkeystore2_vintf_cpp.so \
    $(TARGET_OUT_SHARED_LIBRARIES)/libjc_keymint_transport_nxp.so \
    $(TARGET_OUT_SHARED_LIBRARIES)/libusbhost.so \
    $(TARGET_OUT_SHARED_LIBRARIES)/librecovery_updater_msm.so \
    $(TARGET_OUT_SHARED_LIBRARIES)/libnos_datagram.so \
    $(TARGET_OUT_SHARED_LIBRARIES)/libext2_com_err.so \
    $(TARGET_OUT_SHARED_LIBRARIES)/libext2_misc.so \
    $(TARGET_OUT_SHARED_LIBRARIES)/libkeymasterutils.so \
    $(TARGET_OUT_SHARED_LIBRARIES)/libhardware_legacy.so \
    $(TARGET_OUT_SHARED_LIBRARIES)/libqtikeymint.so \
    $(TARGET_OUT_SHARED_LIBRARIES)/android.hidl.memory.token@1.0.so \
    $(TARGET_OUT_SHARED_LIBRARIES)/libdl.so \
    $(TARGET_OUT_SHARED_LIBRARIES)/libkeymint.so \
    $(TARGET_OUT_SHARED_LIBRARIES)/libkm_compat_service.so \
    $(TARGET_OUT_SHARED_LIBRARIES)/libfs_mgr.so \
    $(TARGET_OUT_SHARED_LIBRARIES)/android.hardware.secure_element@1.2.so \
    $(TARGET_OUT_SHARED_LIBRARIES)/android.hardware.boot@1.0.so \
    $(TARGET_OUT_SHARED_LIBRARIES)/libasyncio.so \
    $(TARGET_OUT_SHARED_LIBRARIES)/android.security.authorization-ndk_platform.so \
    $(TARGET_OUT_SHARED_LIBRARIES)/libchrome.so \
    $(TARGET_OUT_SHARED_LIBRARIES)/libkeymaster4support.so \
    $(TARGET_OUT_SHARED_LIBRARIES)/libutils.so \
    $(TARGET_OUT_SHARED_LIBRARIES)/libkeymaster4_1support.so \
    $(TARGET_OUT_SHARED_LIBRARIES)/libqdutils.so \
    $(TARGET_OUT_SHARED_LIBRARIES)/libsoftkeymasterdevice.so \
    $(TARGET_OUT_SHARED_LIBRARIES)/libspl.so \
    $(TARGET_OUT_SHARED_LIBRARIES)/libnos_transport.so \
    $(TARGET_OUT_SHARED_LIBRARIES)/android.frameworks.stats@1.0.so \
    $(TARGET_OUT_SHARED_LIBRARIES)/android.hardware.health-V1-ndk.so \
    $(TARGET_OUT_SHARED_LIBRARIES)/libutilscallstack.so \
    $(TARGET_OUT_SHARED_LIBRARIES)/libpcre2.so \
    $(TARGET_OUT_SHARED_LIBRARIES)/libkeystore2_aaid.so \
    $(TARGET_OUT_SHARED_LIBRARIES)/libincfs.so \
    $(TARGET_OUT_SHARED_LIBRARIES)/libkeymaster_portable.so \
    $(TARGET_OUT_SHARED_LIBRARIES)/libsivibrator.so \
    $(TARGET_OUT_SHARED_LIBRARIES)/libdmabufheap.so \
    $(TARGET_OUT_SHARED_LIBRARIES)/libkm_compat.so \
    $(TARGET_OUT_SHARED_LIBRARIES)/libext2_quota.so \
    $(TARGET_OUT_SHARED_LIBRARIES)/android.hardware.vibrator@1.2.so \
    $(TARGET_OUT_SHARED_LIBRARIES)/libgsi.so \
    $(TARGET_OUT_SHARED_LIBRARIES)/libext2_uuid.so \
    $(TARGET_OUT_SHARED_LIBRARIES)/android.hardware.keymaster@3.0.so \
    $(TARGET_OUT_SHARED_LIBRARIES)/libstdc++.so \
    $(TARGET_OUT_SHARED_LIBRARIES)/android.security.maintenance-ndk_platform.so \
    $(TARGET_OUT_SHARED_LIBRARIES)/libc.so \
    $(TARGET_OUT_SHARED_LIBRARIES)/libgatekeeper.so \
    $(TARGET_OUT_SHARED_LIBRARIES)/libandroid_runtime_lazy.so \
    $(TARGET_OUT_SHARED_LIBRARIES)/libext2_blkid.so \
    $(TARGET_OUT_SHARED_LIBRARIES)/libext4_utils.so \
    $(TARGET_OUT_SHARED_LIBRARIES)/libsync.so \
    $(TARGET_OUT_SHARED_LIBRARIES)/android.hardware.confirmationui@1.0.so \
    $(TARGET_OUT_SHARED_LIBRARIES)/libpuresoftkeymasterdevice.so \
    $(TARGET_OUT_SHARED_LIBRARIES)/libkeystore-attestation-application-id.so \
    $(TARGET_OUT_SHARED_LIBRARIES)/libhidlmemory.so \
    $(TARGET_OUT_SHARED_LIBRARIES)/libselinux.so \
    $(TARGET_OUT_SHARED_LIBRARIES)/android.hardware.vibrator-V1-ndk_platform.so \
    $(TARGET_OUT_SHARED_LIBRARIES)/android.hardware.vibrator@1.0.so \
    $(TARGET_OUT_SHARED_LIBRARIES)/libhwbinder.so \
    $(TARGET_OUT_SHARED_LIBRARIES)/android.hardware.security.rkp-V3-ndk.so \
    $(TARGET_OUT_SHARED_LIBRARIES)/libsysutils.so \
    $(TARGET_OUT_SHARED_LIBRARIES)/libbmlutils.so \
    $(TARGET_OUT_SHARED_LIBRARIES)/android.hardware.fastboot@1.0.so \
    $(TARGET_OUT_SHARED_LIBRARIES)/liblog.so \
    $(TARGET_OUT_SHARED_LIBRARIES)/libxml2.so \
    $(TARGET_OUT_SHARED_LIBRARIES)/libandroidicu.so \
    $(TARGET_OUT_SHARED_LIBRARIES)/libtinyxml2.so \
    $(TARGET_OUT_SHARED_LIBRARIES)/libdiag.so \
    $(TARGET_OUT_SHARED_LIBRARIES)/libz.so \
    $(TARGET_OUT_SHARED_LIBRARIES)/libvndksupport.so \
    $(TARGET_OUT_SHARED_LIBRARIES)/libziparchive.so \
    $(TARGET_OUT_SHARED_LIBRARIES)/libclang_rt.ubsan_standalone-aarch64-android.so \
    $(TARGET_OUT_SHARED_LIBRARIES)/ld-android.so \
    $(TARGET_OUT_SHARED_LIBRARIES)/android.hardware.keymaster-V3-ndk.so \
    $(TARGET_OUT_SHARED_LIBRARIES)/libtwadbbu.so \
    $(TARGET_OUT_SHARED_LIBRARIES)/libutil-linux.so \
    $(TARGET_OUT_SHARED_LIBRARIES)/android.security.apc-ndk_platform.so \
    $(TARGET_OUT_SHARED_LIBRARIES)/libdrmutils.so \
    $(TARGET_OUT_SHARED_LIBRARIES)/libkeymasterdeviceutils.so \
    $(TARGET_OUT_SHARED_LIBRARIES)/android.system.suspend@1.0.so \
    $(TARGET_OUT_SHARED_LIBRARIES)/android.system.keystore2-V1-ndk.so \
    $(TARGET_OUT_SHARED_LIBRARIES)/libssl.so \
    $(TARGET_OUT_SHARED_LIBRARIES)/libcrypto_utils.so \
    $(TARGET_OUT_SHARED_LIBRARIES)/android.hardware.security.keymint-V1-ndk_platform.so \
    $(TARGET_OUT_SHARED_LIBRARIES)/android.hardware.security.keymint-V1-cpp.so \
    $(TARGET_OUT_SHARED_LIBRARIES)/libcap.so \
    $(TARGET_OUT_SHARED_LIBRARIES)/android.hidl.memory@1.0.so \
    $(TARGET_OUT_SHARED_LIBRARIES)/liblogwrap.so \
    $(TARGET_OUT_SHARED_LIBRARIES)/android.hardware.authsecret@1.0.so \
    $(TARGET_OUT_SHARED_LIBRARIES)/libbacktrace.so \
    $(TARGET_OUT_SHARED_LIBRARIES)/libhardware.so \
    $(TARGET_OUT_SHARED_LIBRARIES)/libadbd_auth.so \
    $(TARGET_OUT_SHARED_LIBRARIES)/libhidltransport.so \
    $(TARGET_OUT_SHARED_LIBRARIES)/libops.so \
    $(TARGET_OUT_SHARED_LIBRARIES)/libdisplayconfig.qti.so \
    $(TARGET_OUT_SHARED_LIBRARIES)/libtfavib.so \
    $(TARGET_OUT_SHARED_LIBRARIES)/android.security.compat-ndk_platform.so \
    $(TARGET_OUT_SHARED_LIBRARIES)/libsoft_attestation_cert.so \
    $(TARGET_OUT_SHARED_LIBRARIES)/android.hardware.security.sharedsecret-V1-ndk.so \
    $(TARGET_OUT_SHARED_LIBRARIES)/libqcbor.so \
    $(TARGET_OUT_SHARED_LIBRARIES)/android.hardware.weaver@1.0.so \
    $(TARGET_OUT_SHARED_LIBRARIES)/libnetd_client.so \
    $(TARGET_OUT_SHARED_LIBRARIES)/liblz4.so \
    $(TARGET_OUT_SHARED_LIBRARIES)/libfec.so \
    $(TARGET_OUT_SHARED_LIBRARIES)/android.hardware.keymaster@4.1.so \
    $(TARGET_OUT_SHARED_LIBRARIES)/libgatekeeper_aidl.so \
    $(TARGET_OUT_SHARED_LIBRARIES)/android.hardware.security.secureclock-V1-cpp.so \
    $(TARGET_OUT_SHARED_LIBRARIES)/android.hardware.security.sharedsecret-V1-ndk_platform.so \
    $(TARGET_OUT_SHARED_LIBRARIES)/android.system.keystore2-V1-ndk_platform.so \
    $(TARGET_OUT_SHARED_LIBRARIES)/android.hardware.boot-V1-ndk.so \
    $(TARGET_OUT_SHARED_LIBRARIES)/libcutils.so \
    $(TARGET_OUT_SHARED_LIBRARIES)/libncurses.so \
    $(TARGET_OUT_SHARED_LIBRARIES)/libc++.so \
    $(TARGET_OUT_SHARED_LIBRARIES)/libhidl-gen-utils.so \
    $(TARGET_OUT_SHARED_LIBRARIES)/libQSEEComAPI.so \
    $(TARGET_OUT_SHARED_LIBRARIES)/lib_android_keymaster_keymint_utils.so \
    $(TARGET_OUT_SHARED_LIBRARIES)/liblp.so \
    $(TARGET_OUT_SHARED_LIBRARIES)/libion.so \
    $(TARGET_OUT_SHARED_LIBRARIES)/libbinder.so \
    $(TARGET_OUT_SHARED_LIBRARIES)/libaacvibrator.so \
    $(TARGET_OUT_SHARED_LIBRARIES)/libssd.so \
    $(TARGET_OUT_SHARED_LIBRARIES)/libmmcutils.so \
    $(TARGET_OUT_SHARED_LIBRARIES)/android.hardware.health-V2-ndk.so \
    $(TARGET_OUT_SHARED_LIBRARIES)/android.hardware.boot@1.1.so \
    $(TARGET_OUT_SHARED_LIBRARIES)/libkeystore-engine-wifi-hidl.so \
    $(TARGET_OUT_SHARED_LIBRARIES)/android.hardware.vibrator@1.1.so \
    $(TARGET_OUT_SHARED_LIBRARIES)/android.hardware.health@2.0.so \
    $(TARGET_OUT_SHARED_LIBRARIES)/android.hardware.secure_element@1.1.so \
    $(TARGET_OUT_SHARED_LIBRARIES)/libpng.so \
    $(TARGET_OUT_SHARED_LIBRARIES)/libadb_protos.so \
    $(TARGET_OUT_SHARED_LIBRARIES)/libresetprop.so \
    $(TARGET_OUT_SHARED_LIBRARIES)/libext2fs.so \
    $(TARGET_OUT_SHARED_LIBRARIES)/vendor.display.config@1.0.so \
    $(TARGET_OUT_SHARED_LIBRARIES)/libservices.so \
    $(TARGET_OUT_SHARED_LIBRARIES)/libsquashfs_utils.so \
    $(TARGET_OUT_SHARED_LIBRARIES)/libnl.so \
    $(TARGET_OUT_SHARED_LIBRARIES)/libkeymint_support.so \
    $(TARGET_OUT_SHARED_LIBRARIES)/android.hardware.gatekeeper@1.0.so \
    $(TARGET_OUT_SHARED_LIBRARIES)/libGPreqcancel_svc.so \
    $(TARGET_OUT_SHARED_LIBRARIES)/android.hardware.health@2.1.so \
    $(TARGET_OUT_SHARED_LIBRARIES)/libhidlbase.so \
    $(TARGET_OUT_SHARED_LIBRARIES)/libkeystoreinfo.so \
    $(TARGET_OUT_SHARED_LIBRARIES)/android.hardware.vibrator-V2-cpp.so \
    $(TARGET_OUT_SHARED_LIBRARIES)/libtime_genoff.so \
    $(TARGET_OUT_SHARED_LIBRARIES)/libext2_e2p.so \
    $(TARGET_OUT_SHARED_LIBRARIES)/libjsoncpp.so \
    $(TARGET_OUT_SHARED_LIBRARIES)/android.hardware.gatekeeper-V1-ndk.so \
    $(TARGET_OUT_SHARED_LIBRARIES)/libdiskconfig.so \
    $(TARGET_OUT_SHARED_LIBRARIES)/libgpt.so \
    $(TARGET_OUT_SHARED_LIBRARIES)/libprotobuf-cpp-lite.so \
    $(TARGET_OUT_SHARED_LIBRARIES)/libkeyutils.so \
    $(TARGET_OUT_SHARED_LIBRARIES)/libicuuc.so \
    $(TARGET_OUT_SHARED_LIBRARIES)/libadbd_fs.so \
    $(TARGET_OUT_SHARED_LIBRARIES)/android.hidl.allocator@1.0.so \
    $(TARGET_OUT_SHARED_LIBRARIES)/android.hidl.token@1.0.so \
    $(TARGET_OUT_SHARED_LIBRARIES)/android.hardware.boot@1.2.so \
    $(TARGET_OUT_SHARED_LIBRARIES)/libbase.so \
    $(TARGET_OUT_SHARED_LIBRARIES)/libvintf.so \
    $(TARGET_OUT_SHARED_LIBRARIES)/libsparse.so \
    $(TARGET_OUT_SHARED_LIBRARIES)/libbootloader_message.so \
    $(TARGET_OUT_SHARED_LIBRARIES)/libsqlite.so \
    $(TARGET_OUT_SHARED_LIBRARIES)/libsoc_helper_jni.so \
    $(TARGET_OUT_SHARED_LIBRARIES)/android.hardware.vibrator-V2-ndk_platform.so \
    $(TARGET_OUT_SHARED_LIBRARIES)/libssh.so \
    $(TARGET_OUT_SHARED_LIBRARIES)/libcgrouprc.so \
    $(TARGET_OUT_SHARED_LIBRARIES)/libm.so \
    $(TARGET_OUT_SHARED_LIBRARIES)/libunwindstack.so \
    $(TARGET_OUT_SHARED_LIBRARIES)/android.hardware.security.secureclock-V1-ndk_platform.so \
    $(TARGET_OUT_SHARED_LIBRARIES)/android.hardware.secure_element-V1-ndk.so \
    $(TARGET_OUT_SHARED_LIBRARIES)/libvmmem.so \
    $(TARGET_OUT_SHARED_LIBRARIES)/libqisl.so \
    $(TARGET_OUT_SHARED_LIBRARIES)/libdrmfs.so \
    $(TARGET_OUT_SHARED_LIBRARIES)/libkeystore2_apc_compat.so \
    $(TARGET_OUT_SHARED_LIBRARIES)/android.hardware.fastboot@1.1.so \
    $(TARGET_OUT_SHARED_LIBRARIES)/android.se.omapi-V1-ndk.so \
    $(TARGET_OUT_SHARED_LIBRARIES)/android.hardware.vibrator-V1-cpp.so \
    $(TARGET_OUT_SHARED_LIBRARIES)/libsoc_helper.so \
    $(TARGET_OUT_SHARED_LIBRARIES)/libblkid.so \
    $(TARGET_OUT_SHARED_LIBRARIES)/liblzma.so \
    $(TARGET_OUT_SHARED_LIBRARIES)/libprocinfo.so \
    $(TARGET_OUT_SHARED_LIBRARIES)/libntfs-3g.so \
    $(TARGET_OUT_SHARED_LIBRARIES)/librpmb.so \
    $(TARGET_OUT_SHARED_LIBRARIES)/libminkdescriptor.so \
    $(TARGET_OUT_SHARED_LIBRARIES)/libmemunreachable.so \
    $(TARGET_OUT_SHARED_LIBRARIES)/android.hardware.security.keymint-V2-ndk.so \
    $(TARGET_OUT_SHARED_LIBRARIES)/libqservice.so \
    $(TARGET_OUT_SHARED_LIBRARIES)/android.system.wifi.keystore@1.0.so \
    $(TARGET_OUT_SHARED_LIBRARIES)/libfuse-lite.so \
    $(TARGET_OUT_SHARED_LIBRARIES)/android.hardware.health.storage@1.0.so \
    $(TARGET_OUT_SHARED_LIBRARIES)/android.hardware.security.keymint-V3-ndk.so \
    $(TARGET_OUT_SHARED_LIBRARIES)/libdrmtime.so \
    $(TARGET_OUT_SHARED_LIBRARIES)/libkeymaster_messages.so \
    $(TARGET_OUT_SHARED_LIBRARIES)/libpackagelistparser.so \
    $(TARGET_OUT_SHARED_LIBRARIES)/libfusesideload.so \
    $(TARGET_OUT_SHARED_LIBRARIES)/libevent.so \
    $(TARGET_OUT_SHARED_LIBRARIES)/android.hardware.security.secureclock-V1-ndk.so \
    $(TARGET_OUT_SHARED_LIBRARIES)/libbinder_ndk.so \
    $(TARGET_OUT_SHARED_LIBRARIES)/libdl_android.so \
    $(TARGET_OUT_SHARED_LIBRARIES)/libGPQeSE.so \
    $(TARGET_OUT_SHARED_LIBRARIES)/libkeymasterprovision.so \
    $(TARGET_OUT_SHARED_LIBRARIES)/libtar.so \
    $(TARGET_OUT_SHARED_LIBRARIES)/android.hardware.health.storage-V1-ndk_platform.so \
    $(TARGET_OUT_SHARED_LIBRARIES)/libflashutils.so \
    $(TARGET_OUT_SYSTEM_EXT_SHARED_LIBRARIES)/vendor.oplus.hardware.oplusvibrator-V1-ndk.so \
    $(TARGET_OUT_SYSTEM_EXT_SHARED_LIBRARIES)/vendor.oplus.hardware.vibrator-V1-ndk.so \
    $(TARGET_OUT_SYSTEM_EXT_SHARED_LIBRARIES)/vendor.display.config@1.0.so \
    $(TARGET_OUT_SYSTEM_EXT_SHARED_LIBRARIES)/vendor.display.config@2.0.so\
    $(TARGET_OUT_SYSTEM_EXT_SHARED_LIBRARIES)/vendor.aac.hardware.richtap.vibrator-V2-ndk.so

# Kernel module loading for touch, battery etc
TW_LOAD_VENDOR_MODULES := $(shell echo \"$(shell ls $(DEVICE_PATH)/twrp/recovery/root/vendor/lib/modules)\")
TW_LOAD_VENDOR_BOOT_MODULES := true

# TWRP Debug Flags
#TWRP_EVENT_LOGGING := true
TARGET_USES_LOGD := true
TWRP_INCLUDE_LOGCAT := true
TARGET_RECOVERY_DEVICE_MODULES += debuggerd
RECOVERY_BINARY_SOURCE_FILES += $(TARGET_OUT_EXECUTABLES)/debuggerd
TARGET_RECOVERY_DEVICE_MODULES += strace
RECOVERY_BINARY_SOURCE_FILES += $(TARGET_OUT_EXECUTABLES)/strace
#TARGET_RECOVERY_DEVICE_MODULES += twrpdec
#RECOVERY_BINARY_SOURCE_FILES += $(TARGET_RECOVERY_ROOT_OUT)/sbin/twrpdec

ADDITIONAL_SYSTEM_PROPERTIES += ro.vendor.qti.va_aosp.support=1
#
# For local builds only
#
# TWRP zip installer
ifneq ($(wildcard bootable/recovery/installer/.),)
    USE_RECOVERY_INSTALLER := true
    RECOVERY_INSTALLER_PATH := bootable/recovery/installer
endif
# end local build flags
#
