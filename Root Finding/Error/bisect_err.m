function [c,fc] = bisect_err(f, a, b, err)
    % Given a function f and a staring interval (a,b) which contains a root
    % r, an approximation to r, c, is found to have an absolute error less
    % then err.
    fa = f(a);

    % finds the number of itterations required to find c such that the
    % absolute error is less then err
    n = ceil(log(abs(b-a)/err)/log(2)); 

    for i=1:n
        c = (a+b)/2;
        fc = double(f(c));
        if fc*fa<0
            b = c;
        elseif fc*fa>0
            a = c;
            fa = fc;
        else
            return
        end
    end
    c = (a+b)/2;
    fc = double(f(c));
end