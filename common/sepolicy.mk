#
# This policy configuration will be used by all products that
# inherit from Aosp
#

ifeq ($(TARGET_COPY_OUT_VENDOR), vendor)
ifeq ($(BOARD_VENDORIMAGE_FILE_SYSTEM_TYPE),)
TARGET_USES_PREBUILT_VENDOR_SEPOLICY ?= true
endif
endif

BOARD_PLAT_PUBLIC_SEPOLICY_DIR += \
    device/aosp/sepolicy/common/public

BOARD_PLAT_PRIVATE_SEPOLICY_DIR += \
    device/aosp/sepolicy/common/private

ifeq ($(TARGET_USES_PREBUILT_VENDOR_SEPOLICY), true)
BOARD_PLAT_PRIVATE_SEPOLICY_DIR += \
    device/aosp/sepolicy/common/dynamic
else
BOARD_VENDOR_SEPOLICY_DIRS += \
    device/aosp/sepolicy/common/dynamic \
    device/aosp/sepolicy/common/vendor
endif

# Include atv rules on atv product
ifeq ($(PRODUCT_IS_ATV), true)
include device/aosp/sepolicy/atv/sepolicy.mk
endif
