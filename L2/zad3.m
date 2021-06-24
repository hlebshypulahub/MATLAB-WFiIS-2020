% odczytuje dane
pkb = readtable('PKB.dat');
% rysuje wykres
bar(pkb.Var1, pkb.Var3,'FaceColor',[0.863 0.078 0.235],...
'EdgeColor',[178/255 34/255 34/255],'LineWidth',2);
xlabel('Państwo');
ylabel('PKB');
title('PKB per capita');
% zmieniam indeksy na kraje
set(gca, 'XTick', 1:10, 'XTickLabel', pkb.Var2);
