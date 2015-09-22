CC = cc
LIBS = -lpthread 
CFLAGS = -O2 -w
SRCS = antisocial.c selfCfg.c runtime.c
OBJS = antisocial.o selfCfg.o runtime.o

all : selfCfg

.c.o :
	${CC} ${CFLAGS} -c $< 

selfCfg : $(OBJS)
	$(CC) -o $@ $(OBJS) $(LIBS) -lm

clean:
	rm -f *.o *~ selfCfg
