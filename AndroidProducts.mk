#
# Copyright (C) 2022-2026 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#
# Rama infinity-sixteen: registra SOLO infinity_eqe.
# NO registrar lineage_eqe.mk acá: hereda vendor/lineage/... que no existe en el
# checkout de Infinity (usa vendor/infinity). El archivo lineage_eqe.mk puede quedar
# físicamente en la rama; simplemente no se registra como producto.

PRODUCT_MAKEFILES := \
$(LOCAL_DIR)/infinity_eqe.mk

COMMON_LUNCH_CHOICES := \
infinity_eqe-user \
infinity_eqe-userdebug \
infinity_eqe-eng
