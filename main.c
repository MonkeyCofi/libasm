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
	printf("\n");
	/*
		tests for ft_strlen
	*/
	{
		printf("=======================\n");
		printf("ft_strlen tests\n");
		printf("=======================\n");
		char *str = "hello, world";
		ssize_t len = ft_strlen(str);
		printf("the length of str %s is %ld\n", str, len);
		str = "";
		len = ft_strlen(str);
		printf("the length of str %s is %ld\n", str, len);
		printf("=======================\n\n");
	}

	/*
		tests for ft_strcpy
	*/
	{
		printf("ft_strcpy tests\n");
		char *src = "hello";
		char dest[] = "there";
		printf("source string: %s\n\n", src);
		printf("dest before copy: %s\n", dest);
		char *ret = ft_strcpy(dest, src);
		printf("dest after copy: %s\n", dest);
		if (ret == dest)
			printf("dest and strcpy return are the same address\n");
		else
			printf("strcpy returned a different address\n");
		printf("dest: %p, strcpy: %p\n", dest, ret);
		printf("=======================\n\n");
	}
}
