CC     = cc
OFLAGS = -O3

all: memcpy_orig memcpy_asm memcpy_dumb memcpy_orig_o3 memcpy_asm_o3 memcpy_dumb_o3

memcpy_orig: main.c
	$(CC) $(CFLAGS) -DMEMCPY_ORIG main.c -o memcpy_orig

memcpy_asm: main.c
	$(CC) $(CFLAGS) -DMEMCPY_ASM main.c -o memcpy_asm

memcpy_dumb: main.c
	$(CC) $(CFLAGS) -DMEMCPY_DUMB main.c -o memcpy_dumb

memcpy_orig_o3: main.c
	$(CC) $(CFLAGS) $(OFLAGS) -DMEMCPY_ORIG main.c -o memcpy_orig_o3

memcpy_asm_o3: main.c
	$(CC) $(CFLAGS) $(OFLAGS) -DMEMCPY_ASM main.c -o memcpy_asm_o3

memcpy_dumb_o3: main.c
	$(CC) $(CFLAGS) $(OFLAGS) -DMEMCPY_DUMB main.c -o memcpy_dumb_o3

clean:
	rm memcpy_orig
	rm memcpy_asm
	rm memcpy_dumb
	rm memcpy_orig_o3
	rm memcpy_asm_o3
	rm memcpy_dumb_o3
