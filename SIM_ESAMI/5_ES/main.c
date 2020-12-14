#include <stdio.h>
int main()
{
	char src[255];
	int ret;
	ret = assitoa(-32, 1, src);
	printf(" %s\n %d ", src, ret);
}