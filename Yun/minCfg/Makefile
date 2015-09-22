LIBS = -lpthread -lmosquitto -L/openwrt-yun/staging_dir/target-mips_r2_uClibc-0.9.33.2/lib -L/openwrt-yun/staging_dir/target-mips_r2_uClibc-0.9.33.2/usr/lib -L/openwrt-yun/staging_dir/toolchain-mips_r2_gcc-4.6-linaro_uClibc-0.9.33.2/lib -L/openwrt-yun/staging_dir/target-mips_r2_uClibc-0.9.33.2/yun-gcc/lib/

CFLAGS = -O2 -w -I/openwrt-yun/staging_dir/target-mips_r2_uClibc-0.9.33.2/usr/include -I/openwrt-yun/staging_dir/target-mips_r2_uClibc-0.9.33.2/include
SRCS = ButtonController.c minCfg.c runtime.c
OBJS = ButtonController.o minCfg.o runtime.o

all : minCfg

.c.o :
	${CC} ${CFLAGS} -c $< 

minCfg : $(OBJS)
	$(CC) -o $@ $(OBJS) $(LIBS) -lm

clean:
	rm -f *.o *~ minCfg
