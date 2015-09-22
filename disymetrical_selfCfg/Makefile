CC = cc
LIBS = -lpthread 
CFLAGS = -O2 -w
SRCS = antisocial.c disymetrical_selfCfg.c runtime.c
OBJS = antisocial.o disymetrical_selfCfg.o runtime.o

all : disymetrical_selfCfg

.c.o :
	${CC} ${CFLAGS} -c $< 

disymetrical_selfCfg : $(OBJS)
	$(CC) -o $@ $(OBJS) $(LIBS) -lm

clean:
	rm -f *.o *~ disymetrical_selfCfg
