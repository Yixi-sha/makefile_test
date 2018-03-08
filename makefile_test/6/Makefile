#src := a.cc b.cc c.cc
#obj := $(src:cc=o)
src := a1b.c a2b.c a23b.c ab.c
obj := $(src:a%c=x%y)

define display
	@echo "obj => $(obj)"
	@echo "obj => $(obj)"
endef



test :
	$(display)