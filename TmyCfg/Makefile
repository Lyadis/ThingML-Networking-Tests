CC = cc
LIBS = -lpthread 
CFLAGS = -O2 -w
SRCS = T2.c T1.c TmyCfg.c runtime.c
OBJS = T2.o T1.o TmyCfg.o runtime.o

all : TmyCfg

.c.o :
	${CC} ${CFLAGS} -c $< 

TmyCfg : $(OBJS)
	$(CC) -o $@ $(OBJS) $(LIBS) -lm

clean:
	rm -f *.o *~ TmyCfg
