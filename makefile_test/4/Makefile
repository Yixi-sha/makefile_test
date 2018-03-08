.PHONY : rebuild all clean

TARGET := hello.out
cc := gcc

$(TARGET)  : main.o func.o
	$(CC)  main.o func.o  -o $(TARGET)
	./$(TARGET)
main.o : main.c
	$(CC)  -c main.c -o main.o
func.o : func.c
	$(CC)  -c func.c -o func.o

rebuild : clean all

all : $(TARGET)

clean : 
	rm *.o $(TARGET)

