CC=gcc
CFLAGS=-I$(LIBAV_PATH)
DEPS = avconv.h
LDFLAGS=-lavdevice -lavfilter -lavformat -lavcodec -lavresample -lswscale -lavutil -lx264 -lpthread -lm -ldl -lfreetype -lfontconfig -lfreetype -lfdk-aac -lbmd -ldl -lstdc++ -lm -lz -pthread -ljson-c

%.o: %.c $(DEPS)
	$(CC) -c -o $@ $< $(CFLAGS)

avconv: avconv.o avconv_opt.o avconv_filter.o cmdutils.o
	gcc -o avconv cmdutils.o avconv_opt.o avconv_filter.o avconv.o $(LDFLAGS)

.PHONY: clean

clean:
	rm -f *.o hellomake
