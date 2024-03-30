#include <stdio.h>
#include <iostream>

enum class nums
{
    one,
    two,
    three = 3,
    four
};

int main(int argc, char const *argv[])
{
    nums n = nums::four;
    // n = nums::one;
    printf("%d\n", static_cast<int>(n));
    // std::cout << n << std::endl;
    return 0;
}
