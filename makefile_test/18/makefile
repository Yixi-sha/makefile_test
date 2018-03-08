CFLAGS := -I inc

vpath %.h inc
vpath %.c src2
vpath %.c src1



app.out : main.o func.o 
	gcc -o $@ $^

%.o : %.c
	gcc $(CFLAGS) -o $@ -c $^