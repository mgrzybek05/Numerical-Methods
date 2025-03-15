format long

syms x;
syms y;

f(x) = -(x^5)/(5+x^6); % one dimensional function
g(x,y) = sqrt(x^2 + y^2); % 2d convex function
h(x,y) = sin(x) + sin(y); % 2d concave function
v = [0.5 1];

[xn, fn] = gradient_descent_1D(f, 0.5, 1, 10^(-6), 50, 2);
[xn, fn] = gradient_ascent_1D(f, 0.5, 1, 10^(-6), 50, 2);

[vn, fn] = gradient_descent_2D(g, 0.5, 1, 0.5, 0.2, 10, 2);
[vn, fn] = gradient_ascent_2D(h, 0.5, 1, 0.5, 0.2, 10, 2);

[vn, fn] = gradient_descent(g, [0.5 1], 0.5, 0.2, 10, 2);
[vn,fn] = gradient_ascent(h, [0.5, 1], 0.5, 0.2, 10, 2);
