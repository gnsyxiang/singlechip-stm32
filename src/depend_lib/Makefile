# ===============================================================
# 
# Release under GPLv2.
# 
# @file    Makefile
# @brief   
# @author  gnsyxiang <gnsyxiang@163.com>
# @date    14/01 2019 14:53
# @version v0.0.1
# 
# @since    note
# @note     note
# 
#     change log:
#     NO.     Author              Date            Modified
#     00      zhenquan.qiu        14/01 2019      create the file
# 
#     last modified: 14/01 2019 14:53
# ===============================================================

# TO_TOP_DIR	:= ..
#
# include $(TO_TOP_DIR)/configs/com-var-def.mk
#
# STM32LIB = $(shell pwd)
#
#
# $(TARGET): $(TARGET)-core $(TARGET)-driver $(TARGET)-ld
#
# $(TARGET)-core:
	# cd $(STM32_DEVICE_SUPPORT) \
		# && $(GCC) $(CFLAGS) system_stm32f10x.c
	# cd $(STM32_ARM_STARTUP) \
		# && $(GCC) $(CFLAGS) startup.c
#
# $(TARGET)-driver:
	# cd $(STM32_DRIVER) \
		# && $(GCC) $(CFLAGS) *.c

###################################################################

TO_TOP_DIR 	:= ../..

include $(TO_TOP_DIR)/configs/com-var-def.mk

# --------------
# target setting
# --------------
TARGET_DEMO 	?= main
TARGET_LIB_NAME ?= stm32f10x

# ---
# dir
# ---
STM32_VERSION 			:= STM32F10x_StdPeriph_Lib_V$(ALL_VERSION)
STM32_DEVICE_SUPPORT 	:= $(STM32_VERSION)/Libraries/CMSIS/CM3/DeviceSupport/ST/STM32F10x
STM32_CORE_SUPPORT 		:= $(STM32_VERSION)/Libraries/CMSIS/CM3/CoreSupport
STM32_ARM_STARTUP 		:= $(STM32_DEVICE_SUPPORT)/startup/arm
STM32_DRIVER 			:= $(STM32_VERSION)/Libraries/STM32F10x_StdPeriph_Driver

# -------
# version
# -------
MAJOR_VERSION 	?= 3
MINOR_VERSION 	?= 5
RELEASE_VERSION ?= 0

ALL_VERSION 	?= $(MAJOR_VERSION).$(MINOR_VERSION).$(RELEASE_VERSION)

TARGET_LIB 	  	:= lib$(TARGET_LIB_NAME).so.$(ALL_VERSION)
TARGET_LIB_MAJ 	:= lib$(TARGET_LIB_NAME).so.$(MAJOR_VERSION)
TARGET_LIB_SO 	:= lib$(TARGET_LIB_NAME).so

TARGET_PATH := $(LIB_DIR)/$(TARGET_LIB)

# ------
# cflags
# ------

CFLAGS 	:= -g -mcpu=cortex-m3 -mthumb -Wall -Werror \
		  -D VECT_TAB_FLASH -D STM32F10X_HD
LIB_CFLAGS += $(CFLAGS) -fPIC

# -------
# ldflags
# -------
SO_NAME 	:= -Wl,-soname=$(TARGET_LIB_MAJ)

LD_COM_FLAG := $(SYSTEM_32_64) -L$(LIB_DIR) -L$(TO_TOP_DIR)/lib -lutils -lnetwork

LDFLAGS 	+= -Wl,-rpath=$(LIB_DIR):$(TO_TOP_DIR)/lib $(LD_COM_FLAG)
LDFLAGS 	+= -l$(TARGET_LIB_NAME)
LDFLAGS 	+= -lpthread
LIB_LDFLAGS := $(SO_NAME) -shared $(LD_COM_FLAG)

# -------
# h files
# -------

# -------
# c files
# -------
SRC_DIR 	:= $(STM32_DEVICE_SUPPORT) $(STM32_ARM_STARTUP) $(STM32_DRIVER)/src
SRC_DIR 	:= $(STM32_DEVICE_SUPPORT)
SRC_C 		:= $(wildcard $(SRC_DIR)/*.c)
OBJ_C 		:= $(patsubst %.c, $(OBJ_DIR)/%.o, $(SRC_C))
DEP_C 		:= $(patsubst %.c, $(OBJ_DIR)/%.d, $(SRC_C))
DEPS  		?= $(DEP_C)
OBJS  		?= $(OBJ_C)

TARGET_DEMO_SRC_C := $(wildcard $(TST_DIR)/*.c)
TARGET_DEMO_OBJ_C := $(patsubst %.c, $(OBJ_DIR)/%.o, $(TARGET_DEMO_SRC_C))
TARGET_DEMO_DEP_C := $(patsubst %.c, $(OBJ_DIR)/%.d, $(TARGET_DEMO_SRC_C))
TARGET_DEMO_DEPS  ?= $(TARGET_DEMO_DEP_C)
TARGET_DEMO_OBJS  ?= $(TARGET_DEMO_OBJ_C)

###########################################
all: $(OBJS)

include $(TO_TOP_DIR)/configs/com-target-def.mk

#$(TARGET_LIB): $(TARGET_PATH) handle_lib
#
#$(TARGET_PATH): $(OBJS)
#	$(ECHO) $(MSG_LD) $@
#	$(CC) $(CFLAGS) $^ $(LIB_LDFLAGS) -o $@
#	$(strip_obj)
#
#handle_lib: clean_lib
#	$(LN) $(TARGET_LIB) $(LIB_DIR)/$(TARGET_LIB_MAJ)
#	$(LN) $(TARGET_LIB_MAJ) $(LIB_DIR)/$(TARGET_LIB_SO)
#
#clean_lib:
#	$(RM) $(LIB_DIR)/$(TARGET_LIB_MAJ)
#	$(RM) $(LIB_DIR)/$(TARGET_LIB_SO)

debug:
	@echo $(OBJ_C)

# --------
# make *.c
# --------
$(OBJ_C): $(OBJ_DIR)/%.o : %.c
	$(MKDIR) $(dir $@)
	$(ECHO) $(MSG_CC) $<
	$(GCC) -c $(CFLAGS) $< -o $@

# $(DEP_C): $(OBJ_DIR)/%.d : %.c
	# $(MKDIR) $(dir $@);
	# $(CC) -MM $(LIB_CFLAGS) -MT $(@:%.d=%.o) $< >$@
#
# sinclude $(DEPS)

