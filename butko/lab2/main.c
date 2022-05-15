#include <stdio.h>
#include <math.h>

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

    do {
        x1 = *x;
        func(*x, &fx, &dfx);

        if(fabs(dfx) < tol) {
            if(dfx >= 0.0) {
                dfx = tol;
            } else {
                dfx = -tol;
            }
        }

        dx = fx / dfx;
        *x = x1 - dx;
        printf("x=%lf, fx=%lf, dfx=%lf\n", x1, fx, dfx);
    } while (fabs(dx) > fabs(tol * *x));
}

int main() {
    int alldone = 0;
    int error = 0;
    double x, x2;

    do {
        printf("First guess (999. to exit): ");
        scanf("%lf", &x);
        if (x == 999) {
            alldone = 1;
        } else {
            newton(&x);
            printf("\n");
            printf("The solution is %d", x);
            printf("\n");
        }
    } while (alldone != 1);
    return 0;
}
