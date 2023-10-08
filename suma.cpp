#include <stdio.h>
#include <math.h>
#include <iostream>

int altura,i,j;

void main() // Funcion principal
{
    printf("Altura: ");
    scanf("&i",&altura);

    /*for (i = 1; i <= altura; i++)
    {
        printf("Hola Negros\n");
    }*/
    /*while(i<10){
        printf("Odio mi vida\n");
        i++;
    }*/
    if(altura<=0)
    {
        do
        {
            printf("Error, escribe de nuevo: ");
            scanf("&i",&altura);
        } while (altura<=0);
    }
}