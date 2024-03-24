#include <iostream>
#include <stdio.h>
#include <string.h>

typedef union
{
    char a;
    int b;
    double c;
} uni;

int main(int argc, char const *argv[])
{
    printf("%ld\n", sizeof(uni));   //8
    uni u;
    u.a = 'a';
    printf("%c\n", u.a);    
    u.b = 20;
    printf("%d\n", u.b);
    u.c = 3.14;
    printf("%lf\n", u.c);
    return 0;
}
