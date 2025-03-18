function [f] = newton_int(p,q)
    % Create a polynomial of degree n-1 that fits all n points (p,q)
    %{
    @params
    p: input of f (q1 to qn)
    q: output of f evaluated at q (p1 to pn)
    q = f(p)
    
    The newton form of a polynomial interpolant is:
        f(x) = a1 + a2*(x-x1)+a3*(x-x1)*(x-x2)+...+an*(x-x1)*...*(x-xn-1).
    We must find constants a1 through an.

    a1 = q1
    a2 = (q2-q1)/(p2-p1) = f[p1,p2]
    a3 = [(q3-q2)/(p3-p2) - (q2-q1)/(p2-p1)]/(p3-p1) = f[p1,p3]
    a4 = f[p1,p4]
    
    These are newton's divided differences.
    
    f[xi,xi+k] = (f[xi+1,xi+2]-f[xi,xi+1])/(xi+2 - xi)
    
    It follows that, ai = f[p1, pi], which is defined recursively.

    To deal with this recursion we will store our p values along the
    diagonal of a matrix with dimensions nxn, where n = length(p)
    %}
    
    n = length(p);
    M = zeros(n);

    % Fills diagonal of matrix with outputs of desired function.
    for k = 1 : n
        M(k,k) = q(k);
    end
    
    % Generate the divided differences matrix
    % i represents the order of the divided difference, i.e. the "length"
    for i = 1 : n - 1
        % j represents the starting index of the divided difference
        for j = 1 : n - i
            % input x = p
            % f[pi, pi+k] = (f[pi+1,pi+k] - f[pi, pi+k-1])/(pi+k - pi)
            M(j, j+i) = [M(j+1, j+i) - M(j, j+i-1)]/(p(j+i) - p(j));
        end
    end
    
    syms f(x)
    syms newprod(x);
    newprod(x) = 1;
    f(x) = M(1,1);
    
    % Combine coefficients with products to generate function
    for i = 2 : n
        newprod(x) = newprod(x)*(x-p(i-1));
        f(x) = f(x) + M(1,i)*newprod(x);
    end
    
   
    fprintf("The %dth degree polynomial interpolant is: %s\n.", n-1, char(f(x)));
end