.PHONY : rebuild all clean

hello.out  : main.o func.o
	gcc  main.o func.o  -o hello.out
main.o : main.c
	gcc  -c main.c -o main.o
func.o : func.c
	gcc  -c func.c -o func.o

rebuild : clean all

all : hello.out

clean : 
	rm *.o hello.out

