CC = cc
LIBS = -lpthread 
CFLAGS = -O2 -w
SRCS = gateway.c t2.c sender.c t1.c testGroupCfg.c runtime.c
OBJS = gateway.o t2.o sender.o t1.o testGroupCfg.o runtime.o

all : testGroupCfg

.c.o :
	${CC} ${CFLAGS} -c $< 

testGroupCfg : $(OBJS)
	$(CC) -o $@ $(OBJS) $(LIBS) -lm

clean:
	rm -f *.o *~ testGroupCfg
