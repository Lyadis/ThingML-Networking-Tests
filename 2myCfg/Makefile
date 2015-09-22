CC = cc
LIBS = -lpthread 
CFLAGS = -O2 -w
SRCS = T2.c T1.c 2myCfg.c runtime.c
OBJS = T2.o T1.o 2myCfg.o runtime.o

all : 2myCfg

.c.o :
	${CC} ${CFLAGS} -c $< 

2myCfg : $(OBJS)
	$(CC) -o $@ $(OBJS) $(LIBS) -lm

clean:
	rm -f *.o *~ 2myCfg
