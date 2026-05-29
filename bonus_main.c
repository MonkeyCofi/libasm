#include <stdio.h>
#include <math.h>
#include <stdlib.h>

typedef struct s_list {
    void            *data;
    struct s_list   *next;
}   t_list;

extern int      ft_atoi_base(const char *str, const char *base);
extern size_t   ft_strlen(const char *str);
extern size_t   ft_lstsize(t_list *head);
extern size_t   lstsize(t_list *head);


int naive_pow(int base, int exponent)
{
    int result = 1;
    for (int i = 0; i < exponent; i++) {
        result *= base;
    }
    return result;
}

int c_atoi_base(const char *str, const char *base)
{
    if (ft_strlen(base) == 0 || ft_strlen(base) > 10)
        return -1;
    int power = ft_strlen(str) - 1;
    int base_num = ft_strlen(base);
    int result = 0;
    for (int i = 0; str[i]; i++)
    {
        result += (str[i] - '0') * (pow(base_num, power));
        power--;
    }
    return result;
}

int main(void)
{
    const char *str = "69abc";
    const char *base = "0123456789abcdef";
    int n = ft_atoi_base(str, base);
    int cn = c_atoi_base(str, base);
    printf("c %d\nasm %d\n", cn, n);
}