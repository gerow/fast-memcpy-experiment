#include <stdlib.h>
#include <stdio.h>
#include <string.h>

#define MEM_SIZE (1024 * 1024 * 512) /* 512 MB of data. Yeah! */

void *
mg_memcpy(void *restrict dst, const void *restrict src, size_t n)
{
  n /= 8;
  asm (
    "rep movsq"
    : /* no output */
    : "D" (dst), "S" (src), "c" (n)
    : /* no clobbering */
    );
  return dst;
}

void *
dumb_memcpy(void *restrict dst, const void *restrict src, size_t n)
{
  n /= sizeof(int);

  int *restrict idst = dst;
  const int *restrict isrc = src;

  for (int i = 0; i < n; i++) {
    idst[i] = isrc[i];
  }

  return dst;
}

int main(int argc, char **argv)
{
  char *src = malloc(MEM_SIZE);
  char *dst = malloc(MEM_SIZE);

  for (int i = 0; i < MEM_SIZE; i++) {
    src[i] = i;
  }

#ifdef MEMCPY_ASM
  mg_memcpy(dst, src, MEM_SIZE);
#endif /* MEMCPY_ASM */

#ifdef MEMCPY_ORIG
  memcpy(dst, src, MEM_SIZE);
#endif /* MEMCPY_ORIG */

#ifdef MEMCPY_DUMB
  dumb_memcpy(dst, src, MEM_SIZE);
#endif /* MEMCPY_ORIG */

  /*for (int i = 0; i < MEM_SIZE; i++) {
    if (src[i] != dst[i]) {
      printf("memcpy failed on %dth byte!\n", i);
      return -1;
    }
  } */

  free(src);
  free(dst);
  return 0;
}
