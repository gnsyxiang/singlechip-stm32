# ===============================================================
# 
# Release under GPLv2.
# 
# @file    com-target-def.mk
# @brief   
# @author  gnsyxiang <gnsyxiang@163.com>
# @date    14/01 2019 14:48
# @version v0.0.1
# 
# @since    note
# @note     note
# 
#     change log:
#     NO.     Author              Date            Modified
#     00      zhenquan.qiu        14/01 2019      create the file
# 
#     last modified: 14/01 2019 14:48
# ===============================================================

TOP = $(shell pwd)
PROGRAM = stm32f4_out
LIBDIR = $(TOP)/lib
TypeOfMCU=STM32F407xx

TC=arm-none-eabi
CC=$(TC)-gcc
LD=$(TC)-ld -v
OBJCOPY=$(TC)-objcopy
AR=$(TC)-ar
GDB=$(TC)-gdb
INCLUDE=-I$(TOP)/include

COMMONFLAGS=-g -mcpu=cortex-m3 -mthumb
COMMONFLAGSlib=$(COMMONFLAGS)

CFLAGS+=$(COMMONFLAGS) -Wall -Werror $(INCLUDE)
CFLAGS+=-D $(TypeOfMCU)
CFLAGS+=-D VECT_TAB_FLASH

#########################################################
err_no_targets:
	@echo "error: use \"targets = your_target\" to specify your target to make!"
	exit 1

ifeq ($(V),1)
slient_targets=err_no_targets
endif

.SILENT: $(slient_targets)

