.PHONY : rebuild all clean

TARGET := hello.out
cc := gcc

$(TARGET)  : main.o func.o
	$(CC)  $^  -o $@
	./$@
main.o : main.c
	$(CC)  -c $^  -o $@
func.o : func.c
	$(CC)  -c $^  -o $@

rebuild : clean all

all : $(TARGET)

clean : 
	$(RM) *.o $(TARGET)

