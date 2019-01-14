# ===============================================================
# 
# Release under GPLv2.
# 
# @file    Makefile
# @brief   
# @author  gnsyxiang <gnsyxiang@163.com>
# @date    22/12 2018 17:56
# @version v0.0.1
# 
# @since    note
# @note     note
# 
#     change log:
#     NO.     Author              Date            Modified
#     00      zhenquan.qiu        22/12 2018      create the file
# 
#     last modified: 22/12 2018 17:56
# ===============================================================

TO_TOP_DIR 	:= ..

include $(TO_TOP_DIR)/configs/com-var-def.mk

GCC_DIR 		:= gcc-arm-none-eabi-5_4-2016q3
GCC_VERSION 	:= $(GCC_DIR)-20160926
GCC_SRC_VERSION := $(GCC_VERSION)-src.tar.bz2

BUILD_PRE		:= build-prerequisites
BUILD_TOOLCHAIN := build-toolchain

INSTALL_NATIVE 	:= install-native
SYS_TYPE 		:= $(shell echo `uname -s` | tr '[A-Z]' '[a-z]')

all: tar-gcc

tar-gcc:
ifneq ($(GCC_DIR), $(wildcard $(GCC_DIR)))
	$(CAT) $(GCC_VERSION)-$(SYS_TYPE).tar.bz2-* > $(GCC_VERSION)-$(SYS_TYPE).tar.bz2
	$(TAR_XZ) $(GCC_VERSION)-$(SYS_TYPE).tar.bz2
	$(RM) $(GCC_VERSION)-$(SYS_TYPE).tar.bz2
endif

depend-dir:
	$(MKDIR) $(GCC_VERSION)/$(INSTALL_NATIVE)

$(BUILD_PRE):
	cd $(GCC_VERSION) \
		&& ./$(BUILD_PRE).sh \
		--build_tools=$(INSTALL_NATIVE) \
		--skip_steps=mingw32

$(BUILD_TOOLCHAIN):
	cd $(GCC_VERSION) \
		&& ./$(BUILD_TOOLCHAIN).sh \
		--build_tools=$(INSTALL_NATIVE) \
		--skip_steps=mingw32
		--skip_steps=manual

tar-src:
ifneq ($(GCC_VERSION), $(wildcard $(GCC_VERSION)))
	$(CAT) $(GCC_VERSION)-src-num-* > $(GCC_SRC_VERSION)
	$(TAR_BZ) $(GCC_SRC_VERSION)
	cd $(GCC_VERSION)/$(SRC_DIR) \
		&& find -name '*.tar.*' | xargs -I% tar -xf %
	$(RM) $(GCC_SRC_VERSION)
endif

clean:
	$(RM) $(GCC_DIR)

