CC = cc
LIBS = -lpthread 
CFLAGS = -O2 -w
SRCS = PingServer.c PingClient.c PingPongCfg.c runtime.c
OBJS = PingServer.o PingClient.o PingPongCfg.o runtime.o

all : PingPongCfg

.c.o :
	${CC} ${CFLAGS} -c $< 

PingPongCfg : $(OBJS)
	$(CC) -o $@ $(OBJS) $(LIBS) -lm

clean:
	rm -f *.o *~ PingPongCfg
