CC = cc
LIBS = -lpthread 
CFLAGS = -O2 -w
SRCS = Sender.c Receiver.c Serialization_test_Cfg.c runtime.c
OBJS = Sender.o Receiver.o Serialization_test_Cfg.o runtime.o

all : Serialization_test_Cfg

.c.o :
	${CC} ${CFLAGS} -c $< 

Serialization_test_Cfg : $(OBJS)
	$(CC) -o $@ $(OBJS) $(LIBS) -lm

clean:
	rm -f *.o *~ Serialization_test_Cfg
