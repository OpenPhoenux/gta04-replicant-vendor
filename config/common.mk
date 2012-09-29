PRODUCT_BRAND ?= replicant

ifneq ($(TARGET_BOOTANIMATION_NAME),)
    PRODUCT_COPY_FILES += \
        vendor/replicant/prebuilt/common/bootanimation/$(TARGET_BOOTANIMATION_NAME).zip:system/media/bootanimation.zip
endif

PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=0

PRODUCT_PROPERTY_OVERRIDES += \
    keyguard.no_require_sim=true \
    ro.url.legal=http://www.google.com/intl/%s/mobile/android/basic/phone-legal.html \
    ro.url.legal.android_privacy=http://www.google.com/intl/%s/mobile/android/basic/privacy.html \
    ro.com.google.clientidbase=android-google \
    ro.com.android.wifi-watchlist=GoogleGuest \
    ro.setupwizard.enterprise_mode=1 \
    ro.com.android.dateformat=MM-dd-yyyy \
    ro.com.android.dataroaming=false

# Copy over the changelog to the device
PRODUCT_COPY_FILES += \
    vendor/replicant/CHANGELOG.mkdn:system/etc/CHANGELOG-CM.txt

# Backup Tool
PRODUCT_COPY_FILES += \
    vendor/replicant/prebuilt/common/bin/backuptool.sh:system/bin/backuptool.sh \
    vendor/replicant/prebuilt/common/bin/backuptool.functions:system/bin/backuptool.functions \
    vendor/replicant/prebuilt/common/bin/50-cm.sh:system/addon.d/50-cm.sh

# init.d support
PRODUCT_COPY_FILES += \
    vendor/replicant/prebuilt/common/etc/init.d/00banner:system/etc/init.d/00banner \
    vendor/replicant/prebuilt/common/bin/sysinit:system/bin/sysinit

# userinit support
PRODUCT_COPY_FILES += \
    vendor/replicant/prebuilt/common/etc/init.d/90userinit:system/etc/init.d/90userinit

# Compcache/Zram support
PRODUCT_COPY_FILES += \
    vendor/replicant/prebuilt/common/etc/init.local.rc:system/etc/init.local.rc \
    vendor/replicant/prebuilt/common/bin/compcache:system/bin/compcache \
    vendor/replicant/prebuilt/common/bin/handle_compcache:system/bin/handle_compcache

PRODUCT_COPY_FILES +=  \
    vendor/replicant/prebuilt/common/apps/FDroid.apk:system/app/FDroid.apk \
    vendor/replicant/prebuilt/common/apps/Term.apk:system/app/Term.apk \
    vendor/replicant/prebuilt/common/apps/lib/armeabi/libjackpal-androidterm4.so:system/lib/libjackpal-androidterm4.so \
    vendor/replicant/prebuilt/common/apps/Superuser.apk:system/app/Superuser.apk

# Bring in camera effects
PRODUCT_COPY_FILES +=  \
    vendor/replicant/prebuilt/common/media/LMprec_508.emd:system/media/LMprec_508.emd \
    vendor/replicant/prebuilt/common/media/PFFprec_600.emd:system/media/PFFprec_600.emd

# Enable SIP+VoIP on all targets
PRODUCT_COPY_FILES += \
    frameworks/base/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml

# This is CM!
PRODUCT_COPY_FILES += \
    vendor/replicant/config/permissions/com.cyanogenmod.android.xml:system/etc/permissions/com.cyanogenmod.android.xml

# Don't export PS1 in /system/etc/mkshrc.
PRODUCT_COPY_FILES += \
    vendor/replicant/prebuilt/common/etc/mkshrc:system/etc/mkshrc

# T-Mobile theme engine
include vendor/replicant/config/themes_common.mk

# Required CM packages
PRODUCT_PACKAGES += \
    Camera \
    Development \
    LatinIME \
    SpareParts \
    su

# Optional CM packages
PRODUCT_PACKAGES += \
    VideoEditor \
    VoiceDialer \
    SoundRecorder \
    Basic \
    HoloSpiralWallpaper \
    MagicSmokeWallpapers \
    NoiseField \
    Galaxy4 \
    LiveWallpapers \
    LiveWallpapersPicker \
    VisualizationWallpapers \
    PhaseBeam

# Custom CM packages
PRODUCT_PACKAGES += \
    Trebuchet \
    DSPManager \
    libcyanogen-dsp \
    audio_effects.conf \
    CMWallpapers \
    Apollo

# Extra tools in CM
PRODUCT_PACKAGES += \
    openvpn \
    e2fsck \
    mke2fs \
    tune2fs

PRODUCT_PACKAGE_OVERLAYS += vendor/replicant/overlay/dictionaries
PRODUCT_PACKAGE_OVERLAYS += vendor/replicant/overlay/common

PRODUCT_VERSION_MAJOR = 4
PRODUCT_VERSION_MINOR = 0
PRODUCT_VERSION_MAINTENANCE = 4

PRODUCT_VERSION := "Replicant-4.0"

PRODUCT_PROPERTY_OVERRIDES += \
  ro.cm.version=$(PRODUCT_VERSION) \
  ro.modversion=$(PRODUCT_VERSION)
