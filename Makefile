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

TO_TOP_DIR 	:= .

include $(TO_TOP_DIR)/configs/com-var-def.mk

all:
	$(GCC) ./src/demo.c -o main
