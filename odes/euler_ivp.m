function [T,Y] = euler_ivp(f, int, y0, h)
    % Input: function f(t,y), interval: [a,b], initial value y0, step size h
    % Output: time values T, solution approximation Y
    T(1) = int(1);
    Y(1) = y0;

    n = round((int(2)-int(1))/h); % finds number of iterations required

    for i = 1 : n
        T(i+1) = T(i)+h;
        Y(i+1) = Y(i)+ h*f(T(i), Y(i));
    end
end