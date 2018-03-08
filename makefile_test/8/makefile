.PHONY : test

var1 := 1
var2 := $(var1)
var3 :=

test : 
    ifeq ($(var2),$(var3))
		@echo "var2"
    else
		@echo "var3"
    endif

    ifdef (var2)
		@echo "var2"
    else
		@echo "var3"
    endif