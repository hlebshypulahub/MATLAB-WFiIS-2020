% zakres zmiennej t
t = linspace(0,2*pi);
% funkcja sin
y_sin = sin(t);
% funkcja cos
y_cos = cos(t);
% rysuje w dwoch wywolaniach funkcji plot  
plot(t,y_sin,'-k')
hold on
plot(t,y_cos,'--b')
% siatka
grid on;
%podpis OX
xlabel('t');
% podpis OY
ylabel('f(t)');
% podpis krzywych
text(3.05,0.16,'\leftarrow sin(t)','Color','black','FontSize',12);
text(1.48,0.16,'\leftarrow cos(t)','Color','blue','FontSize',12);