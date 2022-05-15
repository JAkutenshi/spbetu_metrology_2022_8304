#include <stdio.h>
#include <math.h>
#include "sampler.h"

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
		SAMPLE;
        func(*x, &fx, &dfx);
		SAMPLE;

        if(fabs(dfx) < tol) {
            if(dfx >= 0.0) {
                dfx = tol;
            } else {
                dfx = -tol;
            }
        }

        dx = fx / dfx;
        *x = x1 - dx;
      //  printf("x=%lf, fx=%lf, dfx=%lf\n", x1, fx, dfx);
    } while (fabs(dx) > fabs(tol * *x));
	SAMPLE;
}

int main(int pargc, char **argv) {
	sampler_init(&pargc, argv);
    int alldone = 0;
    int error = 0;
    double x, x2;
	
	SAMPLE;
    do {
       // printf("First guess (999. to exit): ");
        x = rand();
        if (x == 999) {
            alldone = 1;
        } else {
			SAMPLE;
            newton(&x);
			SAMPLE;
        //    printf("\n");
        //    printf("The solution is %d", x);
        //    printf("\n");
			alldone++;
        }
    } while (alldone != 1);
	SAMPLE;
    return 0;
}