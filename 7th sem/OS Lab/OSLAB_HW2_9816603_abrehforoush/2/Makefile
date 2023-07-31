all: pow
pow: myPower.o main.o
	gcc myPower.o main.o -o pow
myPower.o: myPower.c
	gcc –c myPower.c
main.o: main.c
	gcc –c main.c
install:
	cp pow /bin
uninstall:
	rm -rf /bin/pow
clean:
	rm –rf myPower.o main.o pow
