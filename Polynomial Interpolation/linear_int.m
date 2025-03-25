function [f] = linear_int(Q)
    % Generates a piecewise linear function that fits all points in Q.
    % Qi is a point (xi,f(xi))

    % The formula for the linear interpolant between two end points (x0,x1)
    % is y = (y0(x1-x) + y1(x-x0))/(x1-x0)

    % Given n data points, n-1 intervals are created between xi and xi+1.
    % A linear interpolant is generated for every interval, and then
    % concatinated together for piecewise continuity.
    
    n = length(Q);
    syms x;

    % Let J be the set of linear interpolants
    J = cell(n-1,1);
    % Let I be the set of intervals
    I = cell(n-1,1);

    % Generate the linear interpolant for n-1 intervals
    for i = 1 : n-1
        x0 = Q(i,1);
        x1 = Q(i+1,1);
        y0 = Q(i,2);
        y1 = Q(i+1,2);
        y = (y0*(x1-x)+y1*(x-x0))/(x1-x0);
        J{i} = y;
        I{i} = [x0,x1];
    end

    f = 0;

    % Combine intervals and interpolants to a single piecewise function
    for i = 1 : n-1
        l = I{i}(1);
        r = I{i}(2);
        f = piecewise(l <= x <= r, J{i}, f);
    end

    f = piecewise(x<I{1}(1), J{1},f);
    f = piecewise(x>I{n-1}(2), J{n-1},f);

    fprintf("The piecewise continous linear interpolant is: %s.\n", char(f));
end