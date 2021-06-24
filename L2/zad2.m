% rysuje dzielac przedzial na 4 podprzedzialy
subplot(2,2,1)
% zakres zmiennej t
t = linspace(-2*pi,2*pi);
y_sin = sin(t);
plot(t,y_sin)
% siatka
grid on;
%podpis OX
xlabel('t');
% podpis OY
ylabel('f(t)');
% podpis wykresu
title('sin(t)')

subplot(2,2,2)
t = linspace(-2*pi,2*pi);
y_cos = cos(t);
plot(t,y_cos)
grid on;
%podpis OX
xlabel('t');
% podpis OY
ylabel('f(t)');
title('cos(t)')

subplot(2,2,3)
t = linspace(-pi/2,pi/2);
y_tan = tan(t);
plot(t,y_tan)
grid on;
% zakres po OY
ylim([-10 10]);
%podpis OX
xlabel('t');
% podpis OY
ylabel('f(t)');
title('tan(t)')

subplot(2,2,4)
t = linspace(0,pi);
y_ctg = cot(t);
plot(t,y_ctg)
grid on;
ylim([-10 10]);
% zakres po OX
xlim([-1 4]);
%podpis OX
xlabel('t');
% podpis OY
ylabel('f(t)');
title('ctg(t)')
