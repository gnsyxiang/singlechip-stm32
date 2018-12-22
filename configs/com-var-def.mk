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


TAR_BZ := tar -xjvf
TAR_GZ := tar -xzvf

GCC_PATH := tools/gcc-arm-none-eabi-5_4-2016q3/bin/
GCC_PRE  := arm-none-eabi-
GCC_TOOL := $(GCC_PATH)/$(GCC_PRE)

GCC 	:= $(GCC_TOOL)gcc
GXX 	:= $(GCC_TOOL)g++
STRIP 	:= $(GCC_TOOL)strip

