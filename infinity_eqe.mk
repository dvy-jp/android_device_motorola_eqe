#
# Copyright (C) 2025-2026 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#
# Receta de producto para Project Infinity-X (Vanilla) en el eqe.
# Calcada de lineage_eqe.mk (crDroid). SOLO cambian 5 cosas:
#   1) WITH_GAPPS := false        -> Vanilla, sin la LPA de Google (deja tu OpenEUICC como única LPA)
#   2) INFINITY_MAINTAINER        -> tu crédito
#   3) INFINITY_BUILD := eqe      -> codename para el nombre del zip / fingerprint de Infinity
#   4) el inherit común: vendor/infinity/... en vez de vendor/lineage/...
#   5) PRODUCT_NAME := infinity_eqe (era lineage_eqe)
# Todo lo demás (device.mk, telephony, huella/UDFPS, blobs) se hereda igual y se comparte.

# --- Ajustes propios ANTES de heredar la config de Infinity ---
# 'WITH_GAPPS := false' DEBE ir antes del inherit: en vendor/infinity/config/common.mk
# está como 'WITH_GAPPS ?= true' (?= = "asigná solo si no está definido"), así que si lo
# definimos primero, queda en false y no entra el gms. (verificado en common.mk)
WITH_GAPPS ?= false
INFINITY_MAINTAINER := Dvy-jp
INFINITY_BUILD := eqe

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit_only.mk)
TARGET_SUPPORTS_OMX_SERVICE := false
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# Inherit from eqe device (COMPARTIDO con crDroid: telephony del device, huella/UDFPS,
# PowerShare, eSIM/OpenEUICC y demás HALs entran por acá -> se trasladan solos)
$(call inherit-product, device/motorola/eqe/device.mk)

# Inherit common Infinity stuff.
# OJO: common_full_phone.mk (NO common.mk a secas) -> es el que trae telephony.mk.
# Con common.mk pelado te quedarías sin config de telephony (= sin datos/APN). (verificado)
$(call inherit-product, vendor/infinity/config/common_full_phone.mk)

PRODUCT_NAME := infinity_eqe
PRODUCT_DEVICE := eqe
PRODUCT_MANUFACTURER := motorola
PRODUCT_BRAND := motorola
PRODUCT_MODEL := motorola edge 50 pro

PRODUCT_GMS_CLIENTID_BASE := android-motorola

PRODUCT_BUILD_PROP_OVERRIDES += \
BuildDesc="eqe_g-user 15 V1UMS35H.10-67-7-2 477217-2667a release-keys" \
BuildFingerprint=motorola/eqe_g/eqe:15/V1UMS35H.10-67-7-2/477217-2667a:user/release-keys \
DeviceProduct=eqe_g
