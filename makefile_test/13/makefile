.PHONY : all clean test

include test.txt

all :
	@echo "$@ : $^"

test : all
	@echo "this is test"

test.txt : 
	@echo "this is test.txt"
	@echo "all : c.txt " > test.txt


clean : 
	rm *.txt