% zad 1
A = readmatrix('L4_mac_A.txt');
B = readmatrix('L4_mac_B.txt');
C=A*B;
xlswrite ('L4_mac_C.xls', C, 'wynik');

% zad 2
num=quad('sin', 0, pi/2);
syms x;
sym=int(sin(x), 0, pi/2);
sym1=int(sin(x));

% zad 3
syms x;
f=4*x^7+5*x^4+cos(2*x);
wynik=diff(f);

% zad 4
syms x y
eqns = [2*x+2*y==-6, 10*x-5*y==30];
vars = [y x];
[soly, solx] = solve(eqns,vars);

% zad 5
syms y(x);
dsolve(diff(y)==-2*x*y);

% zad 6
syms x1 x2;
y=x1^2+x2^2-cos(12*x1)-cos(18*x2);
fsurf(y, [-1,1]);
xlabel('x1')
ylabel('x2')
zlabel('y')
title(' trójwymiarowy wykres funkcji Rastrigina')