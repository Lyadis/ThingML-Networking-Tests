CC = cc
LIBS = -lpthread 
CFLAGS = -O2 -w
SRCS = T1.c T2.c myCfg.c runtime.c
OBJS = T1.o T2.o myCfg.o runtime.o

all : myCfg

.c.o :
	${CC} ${CFLAGS} -c $< 

myCfg : $(OBJS)
	$(CC) -o $@ $(OBJS) $(LIBS) -lm

clean:
	rm -f *.o *~ myCfg
