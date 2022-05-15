#include <stdio.h>
#include <math.h>
#include "sampler.h"
#include <time.h>

void func(double x, double* fx, double* dfx) {
    double const a = 18.19,
                 b = -23180.0,
                 c = -0.8858,
                 logp = -4.60517;

    *fx = a + b / x + c * log(x) - logp;
    *dfx = -b / (x * x) + c / x;
}

void newton(double* x) {
    double tol = 1.0E-4;
    double fx, dfx, dx, x1;
	
	SAMPLE;
    do {
        x1 = *x;
        func(*x, &fx, &dfx);
		SAMPLE;
        if(fabs(dfx) < tol) {
			SAMPLE;
            if(dfx >= 0.0) {
				SAMPLE;
                dfx = tol;
				SAMPLE;
            } else {
				SAMPLE;
                dfx = -tol;
				SAMPLE;
            }
			SAMPLE;
        }
		SAMPLE;

        dx = fx / dfx;
        *x = x1 - dx;
		SAMPLE;
      //  printf("x=%lf, fx=%lf, dfx=%lf\n", x1, fx, dfx);
    } while (fabs(dx) > fabs(tol * *x));
	SAMPLE;
}

int main(int pargc, char **argv) {
	sampler_init(&pargc, argv);
    int alldone = 0;
    int error = 0;
    double x, x2;
	srand(time(NULL));
	
	SAMPLE;
    do {
       // printf("First guess (999. to exit): ");
        x = rand() % 10;
		SAMPLE;
        if (x == 0) {
			SAMPLE;
            alldone = 1;
			SAMPLE;
        } else {
			SAMPLE;
            newton(&x);
        //    printf("\n");
        //    printf("The solution is %d", x);
        //    printf("\n");
			SAMPLE;
        }
		SAMPLE;
    } while (alldone != 1);
	SAMPLE;
    return 0;
}