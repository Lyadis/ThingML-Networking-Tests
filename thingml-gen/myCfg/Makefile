CC = cc
LIBS = -lpthread 
CFLAGS = -O2 -w
SRCS = T2.c T1.c myCfg.c runtime.c
OBJS = T2.o T1.o myCfg.o runtime.o

all : myCfg

.c.o :
	${CC} ${CFLAGS} -c $< 

myCfg : $(OBJS)
	$(CC) -o $@ $(OBJS) $(LIBS) -lm

clean:
	rm -f *.o *~ myCfg
