
.PHONY : all




MODULE := $(realpath .)
MODULE := $(notdir $(MODULE))

DIR_OUTPUT := $(addprefix $(DIR_BUILD)/,$(MODULE))

OUTPUT := $(MODULE).a
OUTPUT := $(addprefix $(DIR_BUILD)/,$(OUTPUT))

SRCS := $(wildcard $(DIR_SRC)/*$(TYPE_SRC))

OBJS := $(SRCS:$(TYPE_SRC)=$(TYPE_OBJ))
OBJS := $(patsubst $(DIR_SRC)/%, $(DIR_OUTPUT)/%, $(OBJS))

DEPS := $(SRCS:$(TYPE_SRC)=$(TYPE_DEP))
DEPS := $(patsubst $(DIR_SRC)/%, $(DIR_OUTPUT)/%, $(DEPS))

vpath %$(TYPE_INC) $(DIR_INC)
vpath %$(TYPE_INC) $(DIR_COMMON_INC)
vpath %$(TYPE_SRC) $(DIR_SRC)

-include $(DEPS)

all : $(OUTPUT) 
	@echo "yixi ! $(OUTPUT)"

$(OUTPUT) : $(OBJS)
	$(AR) $(ARFLAGS) $@ $^

$(DIR_OUTPUT)/%$(TYPE_OBJ) : %$(TYPE_SRC)
	$(CC) $(CFLAGS) -o $@ -c $(filter %$(TYPE_SRC), $^)

$(DIR_OUTPUT)/%$(TYPE_DEP) : %$(TYPE_SRC)
	@echo "creat $@"
	@set -e ; \
	$(CC) $(CFLAGS) -MM -E $(filter %$(TYPE_SRC), $^) | sed 's,\(.*\)\.o[ :]*,$(DIR_OUTPUT)/\1$(TYPE_DEP) $@ \: ,g' > $@
	