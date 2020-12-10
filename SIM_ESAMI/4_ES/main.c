#include <stdio.h>
int main()

{
	unsigned char x = 'f';
	//char src[255] = "  ";	// ret = -1
	char src[255] = "aAa";	// ret = -2
	//char src[255] = "AA";	// ret = -3
	// else, ret = random val
	int dstV = 0;
	int dstC = 0;
	int ret = 0;
	ret = conta_vocali_consonanti(src, &dstV, &dstC);
	printf("Vocali = % d Consonanti = % d Ret = %d \n", dstV, dstC, ret);
}