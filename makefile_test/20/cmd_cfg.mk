AR := ar
ARFLAGS := crs

CC := gcc
CFLAGS := -I $(DIR_INC) -I $(DIR_COMMON_INC)

ifeq ($(DEBUG),true)
CFLAGS += -g
endif

MKDIR := mkdir
RM := rm -rf
