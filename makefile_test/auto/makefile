.PHONY : all clean rebuild

MKDIR := mkdir
RM := rm -fr
CC := gcc

SRCS := $(wildcard *.c)

DIR_DEPS := deps
DEPS := $(SRCS:.c=.dep)
DEPS := $(addprefix $(DIR_DEPS)/, $(DEPS))

DIR_EXES := exes
EXE := app.out
EXE := $(addprefix $(DIR_EXES)/, $(EXE))

DIR_OBJS := objs
OBJS := $(SRCS:.c=.o)
OBJS := $(addprefix $(DIR_OBJS)/, $(OBJS))

DIRS := $(DIR_DEPS) $(DIR_EXES) $(DIR_OBJS)


all : $(DIR_OBJS) $(DIR_EXES) $(EXE)
	@echo "all"

ifneq ("$(MAKECMDGOALS)","clean")
include $(DEPS)
endif

$(EXE) : $(OBJS)
	@$(CC) -o $@ $^
	@echo "this EXE"

$(DIR_OBJS)/%.o : %.c
	@$(CC) -o $(filter %.o, $@) -c $(filter %.c, $^)

$(DIRS) :
	$(MKDIR) $@

ifeq ("$(wildcar $(DIR_DEPS))","")
$(DIR_DEPS)/%.dep : $(DIR_DEPS) %.c
else
$(DIR_DEPS)/%.dep : %.c
endif
	@echo "Creating $@ ..."
	@set -e; \
	$(CC) -MM -E $(filter %.c, $^) | sed 's,\(.*\)\.o[ :]*,objs/\1.o $@ : ,g' > $@
	
clean :
	$(RM) $(DIRS)
	
rebuild : clean all
	@echo "this is rebuild"
