#include <stdio.h>
#include <math.h>
#include <stdlib.h>

typedef struct s_list {
	void            *data;
	struct s_list   *next;
}   t_list;

extern int      ft_atoi_base(const char *str, const char *base);
extern size_t   ft_strlen(const char *str);
extern int      ft_list_size(t_list *begin_list);
extern void     ft_list_push_front(t_list **head, void *data);

void test_atoi_base()
{
	char *str = "69abc";
	char *hexa = "0123456789abcdef";
	char *decimal = "0123456789";
	(void)decimal;
	int n = 0;
	n = ft_atoi_base(str, decimal);
	printf("str %s base %s result %d\n", str, hexa, n);
	str = "9a";
	n = ft_atoi_base(str, hexa);
	printf("str %s base %s result %d\n", str, hexa, n);
	str = "             -af";
	n = ft_atoi_base(str, hexa);
	printf("str %s base %s result %d\n", str, hexa, n);
	str = "-123           ";
	n = ft_atoi_base(str, hexa);
	printf("str %s base %s result %d\n", str, hexa, n);
}

int main(void)
{
	test_atoi_base();
	t_list *head = malloc(sizeof(t_list));
	head->data = NULL;
	head->next = NULL;
	int *n = malloc(sizeof(int));
	*n = 5;
	ft_list_push_front(&head, &n);
	perror("ft_list_push_front");
	if (head) {
		t_list *second = head->next;
		if (second)
		{
			printf("there is a next node\n");
		}
		else
			printf("there is only one node\n");
	}
	ft_list_push_front(&head, NULL);
	printf("size %d\n", ft_list_size(head));
}