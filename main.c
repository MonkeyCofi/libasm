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
extern ssize_t	ft_read(int fd, void* buf, size_t count);

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
		str = NULL;
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
	#include <string.h>
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
		res1 = ft_write(1, str, ft_strlen(str));
		res2 = write(1, str, ft_strlen(str));
		if (res1 < 0)
			perror("ft_write");
		if (res2 < 0)
			perror("write");
		printf("ft_write returned %ld\n", res1);
		printf("write returned %ld\n", res2);	
	}

	{
		/*
			tests for ft_open
		*/
		int fd = open("file.txt", O_CREAT | O_RDWR | O_APPEND, 0644);
		if (fd < 0)
			perror("open");
		else
			printf("fd successfully opened at fd %d\n", fd);
		close(fd);
		fd = ft_open("file.txt", O_CREAT | O_RDWR, 0644);
		if (fd < 0)
			perror("ft_open");
		else
			printf("fd2 successfully opened at fd %d\n", fd);
		char *buffer = "It was a wonderful night, such a night as is only possible when we are young, dear reader. The sky was so starry, so bright that, looking at it, one could not help asking oneself whether ill-humoured and capricious people could live under such a sky\n";
		ssize_t bytes = ft_write(fd, buffer, ft_strlen(buffer));
		if (bytes < 0)
			perror("ft_write in ft_read test");
		else
			ft_write(1, "Successfully wrote to file\n", ft_strlen("Successfully wrote to file\n"));
		close(fd);
	}

	{
		/*
			tests for ft_read
		*/

		#define BUFFER_SIZE 32
		int fd = ft_open("file.txt", O_RDONLY);
		if (fd < 0)
			perror("ft_open in ft_read test");
		ssize_t bytes = 0;
		char buffer[BUFFER_SIZE + 1] = {};
		while ((bytes = ft_read(fd, buffer, BUFFER_SIZE)) > 0)
		{
			ft_write(1, buffer, ft_strlen(buffer));
		}
		close(fd);
	}
}
