DIR_PROJECT := $(realpath .)
DIR_BUILD_SUB := $(addprefix $(DIR_BUILD)/, $(MODULES))

MODULE_LIB := $(addsuffix .a, $(MODULES))
MODULE_LIB := $(addprefix $(DIR_BUILD)/, $(MODULE_LIB))

APP := app.out
APP := $(addprefix $(DIR_BUILD)/, $(APP))



DIRS := $(DIR_BUILD) $(DIR_BUILD_SUB)

all : compile link
	@echo "APP => $(APP)"

compile : $(DIR_BUILD) $(DIR_BUILD_SUB)
	@set -e ; \
	for dir in $(MODULES); \
	do  \
		cd $$dir && \
		$(MAKE) all \
		        DEBUG:=$(DEBUG) \
				DIR_BUILD:=$(addprefix $(DIR_PROJECT)/, $(DIR_BUILD)) \
				DIR_COMMON_INC:=$(addprefix $(DIR_PROJECT)/, $(DIR_COMMON_INC)) \
				MOD_CGF:=$(addprefix $(DIR_PROJECT)/, $(MOD_CGF)) \
				CMD_CFG:=$(addprefix $(DIR_PROJECT)/, $(CMD_CFG)) \
				MOD_RULE:=$(addprefix $(DIR_PROJECT)/, $(MOD_RULE)) && \
		cd .. ; \
	done 
	@echo "compile complete"

link : $(MODULE_LIB)
	@echo "link beging"
	$(CC) $(LFLAGS) -o $(APP) -Xlinker "-(" $^ -Xlinker "-)"
	@echo "link over"

$(DIRS) : 
	@echo "create $@"
	$(MKDIR) $@

clean : 
	$(RM) $(DIR_BUILD)

rebuild : clean all
	@echo "rebuild "