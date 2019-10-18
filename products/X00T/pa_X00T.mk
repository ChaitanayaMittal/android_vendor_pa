# Copyright (C) 2019 Paranoid Android
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

# Check for target product
ifeq (pa_X00T,$(TARGET_PRODUCT))

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/product_launched_with_o_mr1.mk)

# Include Paranoid Android common configuration
include vendor/pa/config/common_full_phone.mk

# Generic CAF Packages
include device/qcom/common/common.mk

# Bootanimation
TARGET_BOOT_ANIMATION_RES := 1080

TARGET_USES_AOSP := false
TARGET_USES_QCOM_BSP := false

# Disable qmi EAP-SIM security
DISABLE_EAP_PROXY := true

# Inherit AOSP device configuration
$(call inherit-product, device/asus/X00T/device.mk)

# Device identifier. This must come after all inclusions.
PRODUCT_NAME := pa_X00T
PRODUCT_DEVICE := X00T
PRODUCT_BRAND := asus
PRODUCT_MODEL := ASUS_X00TD
PRODUCT_MANUFACTURER := asus

PRODUCT_GMS_CLIENTID_BASE := android-asus

TARGET_VENDOR := asus

PRODUCT_BUILD_PROP_OVERRIDES += \
    PRODUCT_DEVICE=ASUS_X00T_1 \
    PRODUCT_NAME=WW_X00T \
    PRIVATE_BUILD_DESC="sdm660_64-user 9 PKQ1 1285 release-keys"

# Build fingerprint
BUILD_FINGERPRINT := "Android/sdm660_64/sdm660_64:9/PKQ1/16.2017.1910.059-20190920:user/release-keys"

PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    ro.build.fingerprint=$(BUILD_FINGERPRINT)

endif
