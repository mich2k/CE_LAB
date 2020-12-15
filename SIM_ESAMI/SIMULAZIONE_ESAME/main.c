#include <stdio.h>

int cerca_combinazioni_numero(char* src, int num, int* vettori_num);

int main()
{
	char str[255] = "b 111 1 1 1 1 vita 11 1 2345 111";
	// out
	// 1 = 5
	// 11 = 1
	// 111 = 2
	int vettori_num[3];
	int ret;
	ret = cerca_combinazioni_numero(str, 1, vettori_num);
	printf("%d %d %d", vettori_num[0], vettori_num[1], vettori_num[2]);
}