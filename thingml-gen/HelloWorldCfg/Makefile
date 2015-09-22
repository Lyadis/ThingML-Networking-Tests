CC = cc
LIBS = -lpthread 
CFLAGS = -O2 -w
SRCS = HelloWorldThing.c HelloWorldCfg.c runtime.c
OBJS = HelloWorldThing.o HelloWorldCfg.o runtime.o

all : HelloWorldCfg

.c.o :
	${CC} ${CFLAGS} -c $< 

HelloWorldCfg : $(OBJS)
	$(CC) -o $@ $(OBJS) $(LIBS) -lm

clean:
	rm -f *.o *~ HelloWorldCfg
