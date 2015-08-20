CC=g++

SDIR=./libsrc
IDIR=./libinclude
ODIR=./libbuild
LDIR=./lib

_OBJS=md5.o
OBJS=$(patsubst %,$(ODIR)/%,$(_OBJS))

LIBNAME=libmd5.a

main: lib	
	$(CC) -std=c++0x -o main main.cpp -L./lib/ -lmd5
#	$(CC) -o main `gnustep-config --objc-flags` main.m -lgnustep-base -lobjc -L./lib/ -lmd5

lib: $(OBJS)
	ar -cvq $(LDIR)/$(LIBNAME) $^ 

$(ODIR)/%.o: $(SDIR)/%.cpp $(IDIR)/%.h 
	$(CC) -std=c++0x -c -o $@ $< -I$(IDIR)


.PHONY:clean
clean:
	rm -f $(ODIR)/*.o main *.o $(LDIR)/*.a *.d
