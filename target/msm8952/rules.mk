LOCAL_DIR := $(GET_LOCAL_DIR)

INCLUDES += -I$(LOCAL_DIR)/include -I$(LK_TOP_DIR)/platform/msm_shared
INCLUDES += -I$(LK_TOP_DIR)/dev/gcdb/display -I$(LK_TOP_DIR)/dev/gcdb/display/include

PLATFORM := msm8952

MEMBASE := 0x8F600000 # SDRAM
MEMSIZE := 0x00300000 # 3MB

BASE_ADDR        := 0x80000000
SCRATCH_ADDR     := 0x90000000

DEFINES += DISPLAY_SPLASH_SCREEN=1
DEFINES += DISPLAY_TYPE_MIPI=1
DEFINES += DISPLAY_TYPE_DSI6G=1

DEFINES += PMI_CONFIGURED=1

MODULES += \
	dev/keys \
	lib/ptable \
	dev/pmic/pm8x41 \
	dev/qpnp_haptic \
	dev/vib \
	lib/libfdt \
	dev/qpnp_wled \
	dev/gcdb/display

DEFINES += \
	MEMSIZE=$(MEMSIZE) \
	MEMBASE=$(MEMBASE) \
	BASE_ADDR=$(BASE_ADDR) \
	SCRATCH_ADDR=$(SCRATCH_ADDR)


OBJS += \
	$(LOCAL_DIR)/init.o \
	$(LOCAL_DIR)/meminfo.o \
	$(LOCAL_DIR)/target_display.o \
	$(LOCAL_DIR)/oem_panel.o
ifeq ($(ENABLE_SMD_SUPPORT),1)
OBJS += \
	$(LOCAL_DIR)/regulator.o
endif
