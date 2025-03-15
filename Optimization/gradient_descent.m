function [vn, fn] = gradient_descent(f, v, h, t, nmax, s)
    %{
    @params
    f - objective vector function to be minimized
    v - initial vector
    n - number of independent variables
    h - initial step
    t - tolerance
    nmax - maximum iterations
    s - scaling factor
    @output
    vn - n-th vector estimation such that h < t
    fn - function evaluated at vn
    %}

    vn = v;

    vars = symvar(f);
    fn = double(subs(f, vars, vn));

    % Initialized gradient function - vector of partials of all variables
    gradient = sym(zeros(1, length(v)));
    for i = 1:length(vars)
        % Take partial derivative wrt to vars_i
        df_di =  diff(f, vars(i));
        gradient(i) = df_di;
    end

    n = 0;
    while t < h && n + 1 < nmax
        % Evaluate gradient at vn
        gradient_vn = double(subs(gradient, vars, vn));
        p = vn - h * (gradient_vn/norm(gradient_vn));
        fp = double(subs(f, vars, p));
        
        % If fp < fn then we are closer to a minimum
        if fp < fn
            vn = p;
            fn = fp;
        else
            % If fp > fn then we overstepped the minimum
            h = h/s;
        end
    n = n + 1;
    end

    gradient_vn = double(subs(gradient, vars, vn));
    vn = vn - h * (gradient_vn/norm(gradient_vn));
    fn = double(subs(f, vars, vn));
    n = n + 1;

    if n == nmax
        fprintf("Max Iterations Reached n:\t%d\n", n);
    else
        fprintf("Iterations n:\t%d\n", n);
    end

    fprintf("Vector v:\t%s\n", num2str(vn));
    fprintf("Function f(v):\t%f\n", fn);
    fprintf("Tolerance h:\t%f\n\n", h);
end