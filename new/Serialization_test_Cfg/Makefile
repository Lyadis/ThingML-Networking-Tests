CC = cc
LIBS = -lpthread 
CFLAGS = -O2 -w
SRCS = Receiver.c Sender.c Serialization_test_Cfg.c runtime.c
OBJS = Receiver.o Sender.o Serialization_test_Cfg.o runtime.o

all : Serialization_test_Cfg

.c.o :
	${CC} ${CFLAGS} -c $< 

Serialization_test_Cfg : $(OBJS)
	$(CC) -o $@ $(OBJS) $(LIBS) -lm

clean:
	rm -f *.o *~ Serialization_test_Cfg
