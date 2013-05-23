default: libwiggletools.a wiggleTools.c
	gcc -g -Wall -L. -L${KENT_SRC}/lib/${MACHTYPE} wiggleTools.c -static -lwiggletools -ljkweb -lm -lz -lpthread -lssl -lcrypto -ldl -o wiggletools

libwiggletools.a: wiggleIterators.o wiggleReader.o bigWiggleReader.o wiggleMultiplexer.o wiggleReducers.o bedReader.o bigBedReader.o
	ar rcs libwiggletools.a *.o

%.o: %.c; gcc -g -Wall -I${KENT_SRC}/inc/ -c $< -o $@

clean:
	rm -Rf *.o *.a wiggletools
