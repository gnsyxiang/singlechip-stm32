# ===============================================================
# 
# Release under GPLv2.
# 
# @file    
# @brief   
# @author  gnsyxiang <gnsyxiang@163.com>
# @date    22/12 2018 17:57
# @version v0.0.1
# 
# @since    note
# @note     note
# 
#     change log:
#     NO.     Author              Date            Modified
#     00      zhenquan.qiu        22/12 2018      create the file
# 
#     last modified: 22/12 2018 17:57
# ===============================================================

# scale the maximum concurrency with the number of CPUs.
# # # An additional job is used in order to keep processors busy
# # # If the number of processors is not available, assume one.
PARALLEL_JOBS 	:= $(shell echo $$((1 + `getconf _NPROCESSORS_ONLN 2>/dev/null || echo 1`)))

HOSTMAKE  		:= $(shell which make || echo make)
MAKE1  			:= $(HOSTMAKE) -j1
MAKE 			:= $(HOSTMAKE) -j$(PARALLEL_JOBS)

MKDIR 		:= mkdir -p

TAR_BZ 		:= tar -xjvf
TAR_XZ 		:= tar -xvf
TAR_GZ 		:= tar -xzvf

CAT 		:= cat
RM 			:= rm -rf

# project structure
SRC_DIR 	:= src
INC_DIR 	:= inc
LIB_DIR 	:= lib
RES_DIR 	:= res
OBJ_DIR 	:= obj
TST_DIR 	:= test
DEP_DIR 	:= depend-lib
INS_DIR 	:= install

GCC_PATH 	:= tools/gcc-arm-none-eabi-5_4-2016q3/bin/
GCC_PRE  	:= arm-none-eabi-
GCC_TOOL 	:= $(GCC_PATH)/$(GCC_PRE)

GCC 		:= $(GCC_TOOL)gcc
GXX 		:= $(GCC_TOOL)g++
STRIP 		:= $(GCC_TOOL)strip

