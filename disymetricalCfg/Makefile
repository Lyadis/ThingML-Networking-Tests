CC = cc
LIBS = -lpthread 
CFLAGS = -O2 -w
SRCS = t1.c t2.c disymetricalCfg.c runtime.c
OBJS = t1.o t2.o disymetricalCfg.o runtime.o

all : disymetricalCfg

.c.o :
	${CC} ${CFLAGS} -c $< 

disymetricalCfg : $(OBJS)
	$(CC) -o $@ $(OBJS) $(LIBS) -lm

clean:
	rm -f *.o *~ disymetricalCfg
