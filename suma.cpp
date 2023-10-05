#include <stdio.h>
#include <math.h>
#include <iostream>

int altura,i,j;

void main() // Funcion principal
{
    printf("Altura: ");
    scanf("&i",&altura);

    for (i = 1; i <= altura; i++)
    {
        for (j = 1; j <= i; j++)
        {
            if (j%2==0)
                printf("-");
            else
                printf("+");
        }
        printf("\n");
    }
}
