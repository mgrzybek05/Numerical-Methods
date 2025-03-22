function [A] = riemann_sum_n(f,a,b,n)
   % Gives an approximation of the integral of f over the interval [a,b]
   % with a uniform partition of n subintervals using left start points.

   h = (b+a)/n;
   x = a;
   A = 0;

   while x < b
       A = double(A + f(x));
       x = x + h;
   end

   A = h*A;

   fprintf("The area over the interval [%d, %d] with %d subintervals is %.15f\n", a,b,n,A);
end