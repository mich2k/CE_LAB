#include <stdio.h>

int cerca_combinazioni_lettera(char* src, int num, int* vettori_num);

int main()
{
	char str[255] = "b 111 1 1 1 1 vitbbbaa a a a 11 aaa 111";
	int vettori_num[3];
	int ret;
	ret = cerca_combinazioni_lettera(str, 'b', vettori_num);
	printf("%d %d %d", vettori_num[0], vettori_num[1], vettori_num[2]);
}