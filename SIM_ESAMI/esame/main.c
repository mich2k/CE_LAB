#include <stdio.h>
int main()
{
	char str[255] = "patto catto sono un matto mortacci";
	int ret;
	ret = elimina_doppie(str, 'c');
	printf("\n\t%d\n%s", ret, str);
}