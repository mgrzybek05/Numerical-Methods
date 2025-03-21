syms x;

fig1 = figure;

figure(fig1);
p = [1 2 4 7];
q = [0 2 -2 1];
f = newton_int(p,q);
fplot(f(x),[min(p)-1, max(p)+1])
hold on
scatter(p,q, "filled");

fig2 = figure;

figure(fig2);
p = [1,2,3,4,5,6,7,8];
q = [0,-5,0,5,0,-10,0,10];
g = newton_int(p,q);
fplot(g(x),[min(p)-1, max(p)+1])
hold on
scatter(p,q, "filled");


fig3 = figure;
figure(fig3);
a = [1; 2; 3; 4];
b = [9; 8; 7; 6];
z = [12; 2; 6; -2];
M = [a b];
[s] = surface_int(M,z);
surf(x,y, s)