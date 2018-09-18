 # Inherit from gv-common
 include device/samsung/gv-common/gv-common.mk

DEVICE_PATH := device/samsung/gvlte

# Overlays
DEVICE_PACKAGE_OVERLAYS += $(DEVICE_PATH)/overlay

# Audio
PRODUCT_COPY_FILES += \
    $(DEVICE_PATH)/audio/mixer_paths.xml:system/etc/mixer_paths_0.xml

# Bluetooth
PRODUCT_COPY_FILES += \
    $(DEVICE_PATH)/bluetooth/bt_vendor.conf:system/etc/bluetooth/bt_vendor.conf

# Ril
PRODUCT_PACKAGES += \
    libprotobuf-cpp-fl26 \
    libprotobuf-cpp-full \
    libsecril-client \
    modemloader \
    libxml2 \
    rild \
    libril \
    libreference-ril \
    libsecril-client-sap \
    android.hardware.radio@1.1 \
    android.hardware.radio.deprecated@1.0

# cpboot-daemon for modem
PRODUCT_COPY_FILES += \
    $(DEVICE_PATH)/ril/sbin/cbd:system/bin/cbd \
    device/samsung/exynos7580-common/configs/init/rild.rc:system/vendor/etc/init/rild.rc

# Get non-open-source specific aspects
$(call inherit-product-if-exists, vendor/samsung/gvlte/gvlte-vendor.mk)
