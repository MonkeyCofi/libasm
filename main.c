#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <fcntl.h>

extern size_t	ft_strlen(const char *str);
extern int		ft_strcmp(const char *s1, const char *s2);
extern ssize_t	ft_write(int fd, const void *buffer, size_t count);
//extern int	ft_strcmp(const char *s1, const char *s2);

int main(void)
{
	const char *str1 = "hello world";
	int fd = open("test.txt", O_CREAT | O_RDWR | O_APPEND, 0644);
	if (fd < 0)
		perror("fd");
	// const char *str2 = "hello world";
	// printf("length %ld\n", ft_strlen(str1));
	// printf("diff %i\n", ft_strcmp(str1, str2));
	ssize_t res = ft_write(fd, str1, ft_strlen(str1));
	perror(NULL);
	printf("res %ld\n", res);
	res = ft_write(fd, "\n", 1);
	// ssize_t res = write(fd, str1, ft_strlen(str1));
	perror(NULL);
	printf("res %ld\n", res);
}
