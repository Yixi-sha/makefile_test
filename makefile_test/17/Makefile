OBJS := func.o main.o

INC := inc
SRC := src

vpath %.h $(INC)
vpath %.c $(SRC)

CFLAGS := -I $(INC)

hello.out : $(OBJS)
	gcc -o $@ $^

$(OBJS):%.o : %.c func.h
	gcc $(CFLAGS) -o $@  -c $< 