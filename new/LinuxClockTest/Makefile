CC = cc
LIBS = -lpthread 
CFLAGS = -O2 -w
SRCS = ClockLinux.c ClockTestApp.c LinuxClockTest.c runtime.c
OBJS = ClockLinux.o ClockTestApp.o LinuxClockTest.o runtime.o

all : LinuxClockTest

.c.o :
	${CC} ${CFLAGS} -c $< 

LinuxClockTest : $(OBJS)
	$(CC) -o $@ $(OBJS) $(LIBS) -lm

clean:
	rm -f *.o *~ LinuxClockTest
