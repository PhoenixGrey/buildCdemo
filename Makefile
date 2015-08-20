CC=gcc

SDIR=./libsrc
IDIR=./libinclude
ODIR=./libbuild
LDIR=./lib

_OBJS=encryption.o
OBJS=$(patsubst %,$(ODIR)/%,$(_OBJS))

LIBNAME=libencryption.a

main: lib	
	#$(CC) -o main main.c -L./lib/ -lencryption
	$(CC) -o main `gnustep-config --objc-flags` main.m -lgnustep-base -lobjc -L./lib/ -lencryption

lib: $(OBJS)
	ar -cvq $(LDIR)/$(LIBNAME) $^ 

$(ODIR)/%.o: $(SDIR)/%.c $(IDIR)/%.h 
	$(CC) -c -o $@ $< -I$(IDIR)


.PHONY:clean
clean:
	rm -f $(ODIR)/*.o main *.o $(LDIR)/*.a *.d
