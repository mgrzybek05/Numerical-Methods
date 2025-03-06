function [c, fc] = secant_p(f, x0, x1, p, nmax)
    f0 = double(f(x0));
    f1 = double(f(x1));
    re = 1;
    n = 0;

    while re >= (0.5)*10^(-p) && n < nmax
        n = n + 1;
   
        x2 = double(x1 - (x1-x0)*(f1/(f1-f0)));
        re = double(abs((x2-x1)/x2));

        x0 = x1;
        f0 = f1;
        x1 = x2;
        f1 = double(f(x2));
    end
    
    if n >= nmax
        disp("Maximum Iterations Reached")
    end
    
    if re < (0.5)*10^(-p)
        disp("Error Criteria Met")
    end
    
    fc = f1;
    c = x1;
end