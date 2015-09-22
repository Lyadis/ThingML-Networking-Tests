CC = /openwrt-yun/staging_dir/toolchain-mips_r2_gcc-4.6-linaro_uClibc-0.9.33.2/bin/mips-openwrt-linux-gcc
LIBS = -lpthread -l websockets -l ssl -l crypto -l z -L /openwrt-yun/staging_dir/target-mips_r2_uClibc-0.9.33.2/lib -L /openwrt-yun/staging_dir/target-mips_r2_uClibc-0.9.33.2/usr/lib
CFLAGS = -O2 -w -I/openwrt-yun/staging_dir/target-mips_r2_uClibc-0.9.33.2/usr/include -I/openwrt-yun/staging_dir/target-mips_r2_uClibc-0.9.33.2/include
SRCS = ButtonController.c UbberButtonControllerCfg.c runtime.c
OBJS = ButtonController.o UbberButtonControllerCfg.o runtime.o

all : UbberButtonControllerCfg

.c.o :
	${CC} ${CFLAGS} -c $< 

UbberButtonControllerCfg : $(OBJS)
	$(CC) -o $@ $(OBJS) $(LIBS) -lm

clean:
	rm -f *.o *~ UbberButtonControllerCfg
