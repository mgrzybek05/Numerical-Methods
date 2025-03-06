function [c, fc] = newton_p(f, x0, p, nmax)
    syms x;
    g(x) = diff(f(x));
    re = 1;
    n = 0;

    while re >= (0.5)*10^(-p) && n < nmax
        n = n + 1;
        
        f0 = double(f(x0));
        g0 = double(g(x0));
        x1 = double(x0 - f0/g0);

        re = double(abs((x1-x0)/x1));

        x0 = x1;
    end
    
    if n >= nmax
        disp("Maximum Iterations Reached")
    end
    
    if re < (0.5)*10^(-p)
        disp("Error Criteria Met")
    end
    
    c = x1;
    fc = double(f(x1));
end