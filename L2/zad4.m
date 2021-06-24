% pobieram dane
pol = readtable('Poland.dat');
gre = readtable('Greece.dat');
% tworze animacje
h = figure;
filename = 'zad4.gif';
p = animatedline('Color','b','LineWidth',3);
g = animatedline('Color','r','LineWidth',3);
% ustaliam zeby miec statyczne pole
set(gca,'XLim',[2000 2018],'YLim',[0 35000]);
% siatka
grid on;
% podpisy
xlabel('Rok');
ylabel('PKB, $');
title('PKB per capita animation');
% legenda
legend({'Polska','Grecja'},'Location','northeast','Orientation','horizontal')
% petla do rysowania ramek
for i = 1:length(pol.Var1)
    addpoints(p,pol.Var1(i),pol.Var2(i));
    addpoints(g,gre.Var1(i),gre.Var2(i));
    drawnow
    frame = getframe(h); 
    im = frame2im(frame); 
    [imind,cm] = rgb2ind(im,256);
    % zapis do gif
    if i == 1 
        imwrite(imind,cm,filename,'gif', 'Loopcount',inf,'DelayTime',0.2); 
    else 
        imwrite(imind,cm,filename,'gif','WriteMode','append','DelayTime',0.2); 
    end   
end



















