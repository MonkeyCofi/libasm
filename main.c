#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <fcntl.h>
#include <string.h>

extern size_t	ft_strlen(const char *str);
extern int		ft_strcmp(const char *s1, const char *s2);
extern ssize_t	ft_write(int fd, const void *buffer, size_t count);
extern int		ft_open(const char* filename, int flags, ...);
extern char*	ft_strcpy(char *dest, char *src);
//extern int	ft_strcmp(const char *s1, const char *s2);

int main(void)
{
	char *src = "hello";
	char dest[] = "there";
	printf("source string: %s\n\n", src);
	printf("dest before copy: %s\n", dest);
	ft_strcpy(dest, src);
	printf("dest after copy: %s\n", dest);
}
