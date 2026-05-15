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
extern char*	ft_strdup(const char *str);
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
	  (void)len;
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

	/*
		tests for ft_strdup
	*/
	{
		printf("ft_strdup tests\n");
		char *str = "i will be copied";
		char *dup = ft_strdup(str);
		printf("str: %s", str);
		if (dup)
			printf(", dup: %s\n", dup);
		else
			printf("\nThere is no dup\n");
		free(dup);
		printf("=======================\n\n");
	}

	/*
		tests for ft_write
	*/
	{
		char *str = "hello, world\n";
		ssize_t res1 = ft_write(1, str, ft_strlen(str));
    ssize_t res2 = write(1, str, strlen(str));
    if (res1 < 0)
      perror("ft_write");
    printf("ft_write returned %ld\n", res1);
    printf("write returned %ld\n", res2);
    str = NULL;
    res1 = ft_write(1, str, 10);
    res2 = write(1, str, 10);
    if (res1 < 0)
      perror("ft_write");
    if (res2 < 0)
        perror("write");
    printf("ft_write returned %ld\n", res1);
    printf("write returned %ld\n", res2);	
	}

  {
    int fd1 = open("open_test", O_CREAT | O_RDWR | O_APPEND, 0644);
    if (fd1 < 0)
      perror("open");
    else
      printf("fd1 successfully opened at fd %d\n", fd1);
    int fd2 = ft_open("ft_open_test", O_CREAT | O_RDWR | O_APPEND, 0644);
    if (fd2 < 0)
      perror("ft_open");
    else
      printf("fd2 successfully opened at fd %d\n", fd2);
  }
}
