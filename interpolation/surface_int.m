function [s] = surface_int(x,y)
    %{
    @params
    x - nx2 matrix where every row is a pair of points of two independant
    variables
    y - n length vector of all outputs 
    
    Relationship: y_i = s(x_i)
    %}

    n = length(x(:,1));
    M1 = zeros(n);
    M2 = zeros(n);

    % Fill diagonals with y values
    for i = 1 : n
        M1(i,i) = y(i);
        M2(i,i) = y(i);
    end

    % Generate divided differences for first independent variable
    a = x(:,1); % extracts points of first variable
    for i = 1 : n - 1
        for j = 1 : n - i
            M1(j, j+i) = (M1(j+1, j+i) - M1(j, j+i-1))/(a(j+i) - a(j));
        end
    end

    b = x(:,2);
    for i = 1 : n - 1
        for j = 1 : n - i
            M2(j, j+i) = (M2(j+1, j+i) - M2(j, j+i-1))/(b(j+i) - b(j));
        end
    end

    syms s(x,y)
    syms newprod(x,y);
    newprod(x,y) = 1;
    s(x,y) = M1(1,1)*M2(1,1);
    
    % Combine coefficients with products to generate function
    for i = 2 : n
        newprod(x,y) = newprod(x,y)*(x-a(i-1))*(y-b(i-1));
        s(x,y) = s(x,y) + M1(1,i)*M2(1,i)*newprod(x,y);
    end

    fprintf("The surface interpolant is: %s\n.", n-1, char(s(x,y)));    
end