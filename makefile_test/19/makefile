.PHONY : all clean

TYPE_INC := .h
TYPE_SRC := .c
TYPE_OBJ := .o

RM := rm -rf
CC := gcc
MKDIR := mkdir

DIR_INC := inc
DIR_SRC := src

DIR_BUILD := build

LFLAGS :=
ifeq ("$(DEBUG)","true")
CFLAGS := -I $(DIR_INC) -g
else
CFLAGS := -I $(DIR_INC)
endif

vpath %.c $(DIR_SRC)
vpath %.h $(DIR_INC)

APP := $(DIR_BUILD)/app.out

SRC := $(wildcard src/*$(TYPE_SRC))

HDRS := $(wildcard inc/*$(TYPE_INC))
HDRS := $(notdir $(HDRS))

OBJS := $(SRC:$(TYPE_SRC)=$(TYPE_OBJ))
OBJS := $(patsubst src/%, build/%, $(OBJS))

all : $(DIR_BUILD) $(APP)
	@echo "OBJS => $(OBJS)"
	@echo "HDRS => $(HDRS)"
	@echo "APP => $(APP)"

$(DIR_BUILD) :
	$(MKDIR) $@

$(APP) : $(OBJS)
	$(CC) $(LFLAGS) -o $@ $^

$(DIR_BUILD)/%$(TYPE_OBJ) : %.c $(DIR_INC) 
	$(CC) $(CFLAGS) -o $@ -c $(filter %$(TYPE_SRC),$^)

clean : 
	$(RM) $(DIR_BUILD)