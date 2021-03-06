#include <stdio.h>
#include <time.h>
#include <stdlib.h>
#include "sampler.h"

const int max = 200;

void swap(int* a, int* b)
{
    int c = *a;
    *a = *b;
    *b = c;
}

void sort(int x[max], int n)
{
    int left[50], right[50], sp, i, j, mid, pivot;

    left[0] = 0;
    right[0] = n - 1;
    sp = 0;

	SAMPLE;
    while (sp > -1)
    {
        if (left[sp] >= right[sp])
            --sp;
        else
        {
            i = left[sp];
            j = right[sp];
            pivot = x[j];
            mid = (i + j) / 2;

            if (j - i > 5) {
                if ((x[mid] < pivot && x[mid] > x[i]) ||
                    (x[mid] > pivot && x[mid] < x[i]))
                    swap(&(x[mid]), &(x[j]));

                else if ((x[i] < x[mid] && x[i] > pivot) ||
                         (x[i] > x[mid] && x[i] < pivot))
                    swap(&(x[i]), &(x[j]));
            }

            pivot = x[j];
			SAMPLE;
            while (i < j) {
				SAMPLE;
                while (x[i] < pivot)
                    ++i;
				SAMPLE;
                --j;
				SAMPLE;
                while (i < j && pivot < x[j])
                    j--;
				SAMPLE;
                if (i < j)
                    swap(&(x[i]), &(x[j]));
            }
			SAMPLE;

            j = right[sp];
            swap(&(x[i]), &(x[j]));
            if (i - left[sp] >= right[sp] - i) {
                left[sp + 1] = left[sp];
                right[sp + 1] = i - 1;
                left[sp] = i + 1;
            }
            else
            {
                left[sp + 1] = i + 1;
                right[sp + 1] = right[sp];
                right[sp] = i - 1;
            }
            ++sp;
        }
    }
	SAMPLE;
}

int main(int pargc, char **argv) {
	sampler_init(&pargc, argv);
	
    int n = max;
    int x[max];
    srand(time(NULL));

    for (int i = 0; i < n; ++i)
        x[i] = rand() % 100;

	SAMPLE;
    sort(x, n);
	SAMPLE;

   // for (int i = 0; i < n; ++i)
   //     printf("%d ", x[i]);

    return 0;
}