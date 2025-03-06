function [c,fc] = bisect_n(f, a, b, n)
    fa = f(a);

    for i=1:n
        c = (a+b)/2;
        fc = f(c);
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
    fc = f(c);
end