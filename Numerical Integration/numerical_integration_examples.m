format long

syms x;

f(x) = sin(x^2);
g(x) = exp(-x^2) * 2/sqrt(pi);

[A1] = riemann_sum_n(f, 0, 1, 5);
[A2] = trapizoid_sum_n(g, 0, 2, 5);
[A3] = simpsons_sum_n(g,0,1,4);