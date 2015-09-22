CC = cc
LIBS = -lpthread 
CFLAGS = -O2 -w
SRCS = t3.c t1.c t2.c testMessageForwarding.c runtime.c
OBJS = t3.o t1.o t2.o testMessageForwarding.o runtime.o

all : testMessageForwarding

.c.o :
	${CC} ${CFLAGS} -c $< 

testMessageForwarding : $(OBJS)
	$(CC) -o $@ $(OBJS) $(LIBS) -lm

clean:
	rm -f *.o *~ testMessageForwarding