#include <stdio.h>
#include <stdlib.h>

extern size_t ft_strlen(const char *str);

int main(void)
{
  printf("length: %ld\n", ft_strlen("hello, world"));

}
