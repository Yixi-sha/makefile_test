.PHONY : rebuild all clean

TARGET := hello.out
cc := gcc

objs := main.o func.o

$(TARGET)  : $(objs)
	$(CC)  -o $@ $^  
	./$@

$(objs) : %.o : %.c
	$(cc) -o $@ -c $^ 


rebuild : clean all

all : $(TARGET)

clean : 
	$(RM) *.o $(TARGET)

