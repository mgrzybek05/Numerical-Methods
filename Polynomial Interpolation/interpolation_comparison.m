syms x;

fig1 = figure;
figure(fig1);

% p = x
% q = f(x)
p = [-2,-1,0, 1, 2];
q = [-4,-1,0, 1, 4];
Q = [p', q'];

f = newton_int(p,q);
g(x) = linear_int(Q);

scatter(p,q, "filled");
axis equal
hold on
fplot(g(x))
hold on
fplot(f(x),[min(p)-1,max(p)+1])
