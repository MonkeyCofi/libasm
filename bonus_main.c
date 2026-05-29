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

void test_atoi_base()
{
    char *str = "69abc";
    char *base = "0123456789abcdef";
    int n = ft_atoi_base(str, base);
    printf("str %s base %s result %d\n", str, base, n);
    str = "9a";
    base = "0123456789";
    n = ft_atoi_base(str, base);
    printf("str %s base %s result %d\n", str, base, n);
}

int main(void)
{
    test_atoi_base();
    t_list *head = malloc(sizeof(t_list));
    head->data = NULL;
    head->next = NULL;
    t_list *node = malloc(sizeof(t_list));
    head->next = node;
    node->next = NULL;
    node->data = NULL;
    printf("size %d\n", ft_list_size(head));
}