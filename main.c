#include <stdio.h>
#include <stdlib.h>

extern size_t	ft_strlen(const char *str);
extern int	ft_strcmp(const char *s1, const char *s2);

//int main(void)
//{
//	printf("ft_strlen: \n");
//	const char *str = "hello, world!";
//	printf("Length of string \"%s\": %ld\n", str, ft_strlen(str));
//	printf("ft_strcmp: \n");
//	const char *s1 = "";
//	const char *s2 = "hello";
//	printf("s1: \"%s\" s2: \"%s\": %d\n", s1, s2, ft_strcmp(s1, s2));
//}

int main(void)
{
	const char *s1 = NULL; 
	const char *s2 = "";
	int diff = ft_strcmp(s1, s2);
	printf("difference between '%s' and '%s': %d\n", s1, s2, diff);
}
