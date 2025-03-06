function [c, fc] = mod_false_p(f, a, b, err, nmax)
    % Given a function f and interval (a, b), find a root approximation c
    % such that the approximate absolute error is less then err or the
    % number of itterations exceeds nmax. Method is modified to handle
    % unchanging interval values.
    fa = f(a);
    fb = f(b);
    c = double(b - fb*(b-a)/(fb-fa));  % finds 0th root approximation
    
    abserr = 1;
    n = 1;

    % Initializing counters for the number of sequential a and b
    % initialization
    na = 0;
    nb = 0;
    while abserr >= err && n <= nmax
        fc = double(f(c));
        if fc == 0
            return
        elseif fa*fc<0
            b = c;
            
            % Since b is set, a has remained the same
            % Increment na and reset nb
            na = na + 1;
            nb = 0;
            
            fb = fc;
            % if na > 1, then a has been the same for the last two
            % iterations and the algorithm is stuck so cut fa in half
            if na > 1
                fa = fa/2;
            end
        else
            a = c;

            % Since a is set, therefore b has remained the same
            % Increment nb and reset na
            na = 0;
            nb = nb + 1;

            fa = fc;
            % if nb > 1, then b has been the same for the last two
            % iterations and the algorithm is stuck so cut fb in half
            if nb > 1
                fb = fb/2;
            end
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