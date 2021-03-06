ifeq ($(TARGET_QCOM_DISPLAY_VARIANT),caf-msm8996)
display-hals := libgralloc libcopybit libmemtrack libqservice libqdutils
display-hals += hdmi_cec

ifneq ($(TARGET_PROVIDES_LIBLIGHT),true)
display-hals += liblight
endif

sdm-libs := sdm/libs
display-hals += $(sdm-libs)/utils $(sdm-libs)/core $(sdm-libs)/hwc

ifeq ($(call is-vendor-board-platform,QCOM),true)
    include $(call all-named-subdir-makefiles,$(display-hals))
else
ifneq ($(filter msm% apq%,$(TARGET_BOARD_PLATFORM)),)
    include $(call all-named-subdir-makefiles,$(display-hals))
endif
endif
endif
