func:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 64
        movsd   QWORD PTR [rbp-40], xmm0
        mov     QWORD PTR [rbp-48], rdi
        mov     QWORD PTR [rbp-56], rsi
        movsd   xmm0, QWORD PTR .LC0[rip]
        movsd   QWORD PTR [rbp-8], xmm0
        movsd   xmm0, QWORD PTR .LC1[rip]
        movsd   QWORD PTR [rbp-16], xmm0
        movsd   xmm0, QWORD PTR .LC2[rip]
        movsd   QWORD PTR [rbp-24], xmm0
        movsd   xmm0, QWORD PTR .LC3[rip]
        movsd   QWORD PTR [rbp-32], xmm0
        movsd   xmm0, QWORD PTR [rbp-16]
        divsd   xmm0, QWORD PTR [rbp-40]
        addsd   xmm0, QWORD PTR [rbp-8]
        movsd   QWORD PTR [rbp-64], xmm0
        mov     rax, QWORD PTR [rbp-40]
        movq    xmm0, rax
        call    log
        movq    rax, xmm0
        movq    xmm3, rax
        mulsd   xmm3, QWORD PTR [rbp-24]
        movapd  xmm0, xmm3
        addsd   xmm0, QWORD PTR [rbp-64]
        subsd   xmm0, QWORD PTR [rbp-32]
        mov     rax, QWORD PTR [rbp-48]
        movsd   QWORD PTR [rax], xmm0
        movsd   xmm0, QWORD PTR [rbp-16]
        movq    xmm1, QWORD PTR .LC4[rip]
        xorpd   xmm1, xmm0
        movsd   xmm0, QWORD PTR [rbp-40]
        mulsd   xmm0, xmm0
        divsd   xmm1, xmm0
        movsd   xmm0, QWORD PTR [rbp-24]
        divsd   xmm0, QWORD PTR [rbp-40]
        addsd   xmm0, xmm1
        mov     rax, QWORD PTR [rbp-56]
        movsd   QWORD PTR [rax], xmm0
        nop
        leave
        ret
.LC8:
        .string "x=%lf, fx=%lf, dfx=%lf\n"
newton:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 64
        mov     QWORD PTR [rbp-56], rdi
        movsd   xmm0, QWORD PTR .LC5[rip]
        movsd   QWORD PTR [rbp-8], xmm0
.L7:
        mov     rax, QWORD PTR [rbp-56]
        movsd   xmm0, QWORD PTR [rax]
        movsd   QWORD PTR [rbp-16], xmm0
        mov     rax, QWORD PTR [rbp-56]
        mov     rax, QWORD PTR [rax]
        lea     rcx, [rbp-40]
        lea     rdx, [rbp-32]
        mov     rsi, rcx
        mov     rdi, rdx
        movq    xmm0, rax
        call    func
        movsd   xmm0, QWORD PTR [rbp-40]
        movq    xmm1, QWORD PTR .LC6[rip]
        andpd   xmm1, xmm0
        movsd   xmm0, QWORD PTR [rbp-8]
        comisd  xmm0, xmm1
        jbe     .L3
        movsd   xmm0, QWORD PTR [rbp-40]
        pxor    xmm1, xmm1
        comisd  xmm0, xmm1
        jb      .L10
        movsd   xmm0, QWORD PTR [rbp-8]
        movsd   QWORD PTR [rbp-40], xmm0
        jmp     .L3
.L10:
        movsd   xmm0, QWORD PTR [rbp-8]
        movq    xmm1, QWORD PTR .LC4[rip]
        xorpd   xmm0, xmm1
        movsd   QWORD PTR [rbp-40], xmm0
.L3:
        movsd   xmm0, QWORD PTR [rbp-32]
        movsd   xmm1, QWORD PTR [rbp-40]
        divsd   xmm0, xmm1
        movsd   QWORD PTR [rbp-24], xmm0
        movsd   xmm0, QWORD PTR [rbp-16]
        subsd   xmm0, QWORD PTR [rbp-24]
        mov     rax, QWORD PTR [rbp-56]
        movsd   QWORD PTR [rax], xmm0
        movsd   xmm1, QWORD PTR [rbp-40]
        movsd   xmm0, QWORD PTR [rbp-32]
        mov     rax, QWORD PTR [rbp-16]
        movapd  xmm2, xmm1
        movapd  xmm1, xmm0
        movq    xmm0, rax
        mov     edi, OFFSET FLAT:.LC8
        mov     eax, 3
        call    printf
        movsd   xmm0, QWORD PTR [rbp-24]
        movq    xmm1, QWORD PTR .LC6[rip]
        andpd   xmm0, xmm1
        mov     rax, QWORD PTR [rbp-56]
        movsd   xmm1, QWORD PTR [rax]
        mulsd   xmm1, QWORD PTR [rbp-8]
        movq    xmm2, QWORD PTR .LC6[rip]
        andpd   xmm1, xmm2
        comisd  xmm0, xmm1
        ja      .L7
        nop
        nop
        leave
        ret
.LC9:
        .string "First guess (999. to exit): "
.LC10:
        .string "%lf"
.LC12:
        .string "The solution is %d"
main:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 16
        mov     DWORD PTR [rbp-4], 0
        mov     DWORD PTR [rbp-8], 0
.L15:
        mov     edi, OFFSET FLAT:.LC9
        mov     eax, 0
        call    printf
        lea     rax, [rbp-16]
        mov     rsi, rax
        mov     edi, OFFSET FLAT:.LC10
        mov     eax, 0
        call    __isoc99_scanf
        movsd   xmm0, QWORD PTR [rbp-16]
        ucomisd xmm0, QWORD PTR .LC11[rip]
        jp      .L12
        ucomisd xmm0, QWORD PTR .LC11[rip]
        jne     .L12
        mov     DWORD PTR [rbp-4], 1
        jmp     .L14
.L12:
        lea     rax, [rbp-16]
        mov     rdi, rax
        call    newton
        mov     edi, 10
        call    putchar
        mov     rax, QWORD PTR [rbp-16]
        movq    xmm0, rax
        mov     edi, OFFSET FLAT:.LC12
        mov     eax, 1
        call    printf
        mov     edi, 10
        call    putchar
.L14:
        cmp     DWORD PTR [rbp-4], 1
        jne     .L15
        mov     eax, 0
        leave
        ret
.LC0:
        .long   -687194767
        .long   1077031075
.LC1:
        .long   0
        .long   -1059675392
.LC2:
        .long   1037664099
        .long   -1075029895
.LC3:
        .long   -1355148081
        .long   -1072534607
.LC4:
        .long   0
        .long   -2147483648
        .long   0
        .long   0
.LC5:
        .long   -350469331
        .long   1058682594
.LC6:
        .long   -1
        .long   2147483647
        .long   0
        .long   0
.LC11:
        .long   0
        .long   1083127808