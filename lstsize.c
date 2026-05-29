#include <stddef.h>
typedef struct s_list {
    void *data;
    struct s_list *next;
}   t_list;

size_t lstsize(t_list *node)
{
    size_t size = 0;
    while (node)
    {
        node = node->next;
        size += 1;
    }
    return size;
}
