function [c, fc] = false_position_err(f, a, b, err, nmax)
    % Given a function f and interval (a, b), find a root approximation c
    % such that the approximate absolute error is less then err or the
    % number of itterations exceeds nmax
    fa = f(a);
    fb = f(b);
    c = double(b - fb*(b-a)/(fb-fa));  % finds 0th root approximation
    
    abserr = 1;
    n = 1;
    while abserr >= err && n <= nmax
        fc = double(f(c));
        if fc == 0
            return
        elseif fa*fc<0
            b = c;
            fb = fc;
        else
            a = c;
            fa = fc;
        end
            cprev = c;
            c = double(b - fb*(b-a)/(fb-fa));
            abserr = abs(c-cprev); % finds approximate absolute error
            n = n + 1; % increments itteration count
    end
    if n >= nmax
        disp("Max iterations reached!");
    end
    fc=double(f(c));
end