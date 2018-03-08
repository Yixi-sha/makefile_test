.PHONY : rebuild all clean
cc := gcc
MKDIR := mkdir 
RM := rm -rf 

DIR_OBJS := objs
DIR_TARGET := target

DIR := $(DIR_OBJS) $(DIR_TARGET)

TARGET := $(DIR_TARGET)/hello.out
SRCS := $(wildcard *.c)
OBJS := $(SRCS:.c=.o)
OBJS := $(addprefix $(DIR_OBJS)/, $(OBJS))

$(TARGET) : $(DIR) $(OBJS)
	$(CC) -o $@ $(OBJS)
	@echo "Taget file $(TARGET)"

$(DIR) :
	$(MKDIR) $@

$(DIR_OBJS)/%.o : %.c
  ifeq ($(DEBUG),true)
		$(cc) -o $@ -g -c $^
  else
		$(cc) -o $@ -c $^
  endif

rebuild : clean all

all : $(TARGET)

clean: 
	$(RM) $(DIR)	