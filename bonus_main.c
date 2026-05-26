#include <stdio.h>
#include <math.h>
extern int      ft_atoi_base(const char *str, const char *base);
extern size_t   ft_strlen(const char *str);

int naive_pow(int base, int exponent)
{
    /*
        base * itself an exponent amount of times
    */
    int result = 1;
    // while (exponent > 0)
    // {
    //     result *= base;
    //     exponent -= 1;
    // }
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
        // int pour = naive_pow(base_num, power);
        // int pow_pow = pow(base_num, power);
        result += (str[i] - '0') * (pow(base_num, power));
        power--;
    }
    return result;
}

int main(void)
{
    const char *str = "01";
    const char *base = "01";
    int n = ft_atoi_base(str, base);
    int cn = c_atoi_base(str, base);
    printf("c %d\nasm %d\n", cn, n);
}