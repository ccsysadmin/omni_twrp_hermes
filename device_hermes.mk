# 64 bit support
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)

# Lannguages option
$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)

# The gps config appropriate for this device
#$(call inherit-product, device/common/gps/gps_us_supl.mk)

$(call inherit-product-if-exists, vendor/lenovo/hermes/hermes-vendor.mk)

DEVICE_PACKAGE_OVERLAYS += device/lenovo/hermes/overlay


ifeq ($(TARGET_PREBUILT_KERNEL),)
	LOCAL_KERNEL := device/lenovo/hermes/kernel
else
	LOCAL_KERNEL := $(TARGET_PREBUILT_KERNEL)
endif


PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
    ro.adb.secure=0 \
    ro.secure=0 \
    ro.debuggable=1 \
    ro.zygote=zygote64_32

PRODUCT_COPY_FILES += \
    $(LOCAL_KERNEL):kernel \
    device/lenovo/hermes/recovery.fstab:recovery/root/etc/twrp.fstab

$(call inherit-product, $(SRC_TARGET_DIR)/product/full.mk)

PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=+7
PRODUCT_NAME := full_hermes
PRODUCT_DEVICE := hermes