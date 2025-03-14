function [xn,fn] = gradient_descent_1D(f, x0, h, hf, nmax, s)
    % f: objective function apart of symbolic package
    % x0: initial independent value
    % h: initial shift value
    % s: scaling factor
    % hf: tolerance

    % Minimize the objective function f until h < hf
    syms x;

    % Initialize the starting position x and evaluate the function
    xn = x0;
    fn = double(f(x0));

    % Find the derivative of f with respect to x
    g(x) = diff(f);

    n = 0;
    while hf < h && n + 1 < nmax
        % generate the nth proposed value
        gx = double(g(xn));
        if gx < 0
            p = xn + h; % move right
        elseif gx > 0
            p = xn - h; % move left
        else
            return; % minimum found
        end
        fp = double(f(p));

        if fp < fn
            % accept proposed p as x
            fn = fp;
            xn = p;
        else
            % reject
            h=h/s;
        end

        n = n + 1;
    end

    % Final iteration to ensure tolerance is less than hf
    gx = double(g(xn));
    if gx < 0
        fn = double(f(xn+h));
        xn = xn + h;
    elseif gx > 0
        fn = double(f(xn-h));
        xn = xn - h;
    else
        return;
    end
    n = n + 1;
    
    if n == nmax
        fprintf("Max Iterations Reached n:\t%d\n",n);
    else
        fprintf("Iterations n:\t%d\n", n);
    end
    
    fprintf("Final Value xn:\t%f\n", xn);
    fprintf("Function f(xn):\t%f\n",fn);
    fprintf("Tolerance h:\t%f\n\n", h);
end
