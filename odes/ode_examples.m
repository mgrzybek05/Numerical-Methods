syms f(t,y);
f(t,y) = y;
int = [0, 1];
y0 = 1;
h = 1;

hold on

n = 5;

for i = 1 : n
    [T,Y] = euler_ivp(f, int, y0, h);
    plot(T,Y, 'DisplayName', sprintf('h=%.4f', h), LineWidth=1, LineStyle='--');
    h = h/2;
end

fplot(exp(t), [0,1], LineWidth=2, DisplayName='exp(t)');

legend;
hold off