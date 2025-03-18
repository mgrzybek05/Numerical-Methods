function [Pn] = taylor_c(f,n)
    % Creates a symbolic taylor approximation of f(x) to degree n
    syms x;
    h = f;
    fact = 1;
    Xi = 1;
    Pn = double(h(0));
    for i=1:n
        h = diff(h);
        fact = fact * i;
        C = double(h(0)/fact);
        Xi = Xi * x;
        Pn = Pn + C*Xi;
    end
end