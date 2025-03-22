function [A] = trapizoid_sum_n(f,a,b,n)
    % Approximate the integral of f over a and b with n subintervals.

    h = (a+b)/n;
    A = 0;

    p = a;
    q = a + h;

    while p < b
        A = A + double(f(p) + f(q));
        p = q;
        q = q + h;
    end

    A = A * h/2;

   fprintf("The area over the interval [%d, %d] with %d subintervals is %.15f\n", a,b,n,A);
end