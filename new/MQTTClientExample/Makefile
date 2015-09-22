CC = cc
LIBS = -lpthread -l paho-mqtt3a -l tmlmqtt
CFLAGS = -O2 -w
SRCS = ClockLinux.c MQTTClientPIM.c MQTTClientPSM.c MQTTClientExample.c runtime.c
OBJS = ClockLinux.o MQTTClientPIM.o MQTTClientPSM.o MQTTClientExample.o runtime.o

all : MQTTClientExample

.c.o :
	${CC} ${CFLAGS} -c $< 

MQTTClientExample : $(OBJS)
	$(CC) -o $@ $(OBJS) $(LIBS) -lm

clean:
	rm -f *.o *~ MQTTClientExample
