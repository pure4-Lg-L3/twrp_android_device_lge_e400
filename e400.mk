$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)

# The gps config appropriate for this device
$(call inherit-product, device/common/gps/gps_eu_supl.mk)
$(call inherit-product-if-exists, vendor/lge/e400/e400-vendor.mk)
$(call inherit-product, $(LOCAL_PATH)/mdpi-dalvik.mk)

DEVICE_PACKAGE_OVERLAYS += device/lge/e400/overlay

PRODUCT_AAPT_CONFIG := normal mdpi ldpi
PRODUCT_AAPT_PREF_CONFIG := ldpi
 
LOCAL_PATH := device/lge/e400

ifeq ($(TARGET_PREBUILT_KERNEL),)
	LOCAL_KERNEL := $(LOCAL_PATH)/kernel
else
	LOCAL_KERNEL := $(TARGET_PREBUILT_KERNEL)
endif

PRODUCT_COPY_FILES += \
    $(LOCAL_KERNEL):kernel \
    $(LOCAL_PATH)/ramdisk/init.e0.rc:root/init.e0.rc \
    $(LOCAL_PATH)/ramdisk/init.recovery.e0.rc:root/init.recovery.e0.rc \
    $(LOCAL_PATH)/ramdisk/ueventd.e0.rc:root/ueventd.e0.rc \
    $(LOCAL_PATH)/ramdisk/init.e0.usb.rc:root/init.e0.usb.rc \
    $(LOCAL_PATH)/system.prop:root/system.prop \
    $(LOCAL_PATH)/twrp/twrp.fstab:root/etc/twrp.fstab 
#   $(LOCAL_PATH)/fstab.e0:root/fstab.e0
#   $(LOCAL_PATH)/ramdisk/init.rc:root/init.rc \

$(call inherit-product, build/target/product/full.mk)


# Common properties
PRODUCT_PROPERTY_OVERRIDES += \
    persist.sys.usb.config=mtp,adb 
   

# Enable Torch
PRODUCT_PACKAGES += Torch

PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=0
PRODUCT_MANUFACTURER := LGE
PRODUCT_BRAND := lge
PRODUCT_NAME := e400
PRODUCT_DEVICE := e400
PRODUCT_MODEL := LG-E400
