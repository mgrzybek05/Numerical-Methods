function [A] = simpsons_sum_n(f,a,b,n)
    % Approximate the integral of f over [a,b] with n uniform subintervals
    % using simpsons 1/3 rule.

    if rem(n,2) ~= 0
        fprintf("N must be an even number.\n");
        return;
    end

    h = (a+b)/n;
    A = f(a);

    x1  = a + h;
    x2 = x1 + h;

    for i = 1 : n/2
        A = A + double(4*f(x1));
        x1 = x1 + 2*h;
    end

    for i = 1 : n/2 - 1
        A = A + double(2*f(x2));
        x2 = x2 + 2*h;
    end

    A = A + double(f(b));
    A = A * h/3;

    fprintf("The area over the interval [%d, %d] with %d subintervals is %.15f\n", a,b,n,A);

end