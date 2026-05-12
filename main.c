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
	const char *str1 = "hello world";
	const char *str2 = "";
	// printf("length %ld\n", ft_strlen(str1));
	printf("diff %i\n", ft_strcmp(str1, str2));

	printf("ft_write test:\n");
	int fd = 1;
	const char *buf = NULL;
	ssize_t res = ft_write(fd, buf, 5);
	if (res == -1)
		perror("ft_write");

	int fd2 = ft_open("file.txt", O_CREAT | O_RDWR, 0644);
	if (fd2 == -1)
		perror("ft_open");
	else {
		const char *bf = "successfully opened file.txt\n";
		ft_write(1, bf, strlen(bf));
	}
	res = ft_write(fd2, "hello, world\n", ft_strlen("hello, world\n"));

	ft_write(1, "ft_strcpy\n", ft_strlen("ft_strcpy\n"));
	char *src = "hello";
	char dest[] = "world";
	ft_write(1, dest, ft_strlen(dest));
	ft_strcpy(dest, src);
	ft_write(1, dest, ft_strlen(dest));
}
