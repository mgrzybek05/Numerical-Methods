function [vn,fn] = gradient_descent_2D(f, x0, y0, h, hf, s)
    % f: the objective function to be minimized
    % x0: initial x value
    % y0: initial y value
    % h: initial kick value
    % hf: tolerance
    % s: scaling factor

    syms x;
    syms y;

    % Initialize the independent variables to their initial values
    fn = double(f(x0,y0));
    vn = [x0 y0];

    % Calculate the partial derivatives of the function with respect to the
    % independed variables x and y
    xgrad(x,y)=diff(f,x); % partial derivative of f wrt to x
    ygrad(x,y)=diff(f,y);

    % Descent
    % To descend onto a minumum, we must calculate test points p using the
    % gradient of the function and the scaling factor h. The gradient of
    % the function f will be the vector g = (xgrad, ygrad).
    n = 0;
    while(hf < h)
        grad = [double(subs(xgrad, [x,y], vn)) double(subs(ygrad, [x,y], vn))];
        p = vn - h * (grad/norm(grad));
        fp = double(subs(f, [x,y], p));
        
        %fprintf("n:\t%d\n", n);
        %fprintf("vn:\t(%f,%f)\n", vn(1),vn(2));
        %fprintf("fn:\t%f\n",fn);
        %fprintf("fp:\t%f\n\n",fp);

        if fp < fn % if fp < fn then we must be closer to a minimum
            vn = p;
            fn = fp;
        else % if fp > fn then we overstepped so reduce h
            h = h/s;
        % We do not consider the case where fp = fn because that suggests
        % we are at a maximum/minimum and implies division by zero.
        end

        n = n + 1;
    end
    fprintf("Iterations n:\t%d\n", n);
    fprintf("Vector v(x,y):\t(%f,%f)\n", vn(1),vn(2));
    fprintf("Function f(v):\t%f\n",fn);
    fprintf("Tolerance h:\t%f\n", h);
end