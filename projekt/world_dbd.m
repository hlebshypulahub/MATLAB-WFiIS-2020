% set(0,'DefaultAxesFontSize',20,'DefaultAxesFontName','Arial Cyr');
% data = readtable('world_dbd.xlsx');
% % tworze animacje
% h = figure;
% filename = 'world_dbd.gif';
% p = animatedline('Color','r','LineWidth',5);
% % ustaliam zeby miec statyczne pole
% set(gca,'XLim',[0 27],'YLim',[0 6*10^6]);
% % siatka
% grid on;
% % podpisy
% xlabel('Data','FontWeight', 'bold');
% ylabel('Liczba zakażeń','FontWeight', 'bold');
% title('Zakażenia w Świecie','FontSize', 20, 'Color', 'k', 'FontWeight', 'bold');
% % legenda
% % legend({'C_1 Legendre’a'},'Location','northeast','Orientation','horizontal','FontSize', 20, 'FontWeight', 'bold')
% % petla do rysowania ramek
% set(gcf, 'Position', get(0, 'Screensize'));
% set(gca,'color',[.98 .93 1],'XTick',1:length(data.num),'XTickLabel',data.date);
% set(gca,'XTickLabelRotation',45)
% for i = 1:length(data.num)
%     addpoints(p,data.num(i),data.total_cases(i));
%     drawnow
%     frame = getframe(h); 
%     im = frame2im(frame); 
%     [imind,cm] = rgb2ind(im,256);
%     % zapis do gif
%     if i == 1 
%         imwrite(imind,cm,filename,'gif', 'Loopcount',inf,'DelayTime',0.1); 
%     else 
%         imwrite(imind,cm,filename,'gif','WriteMode','append','DelayTime',0.1); 
%     end   
% end

% set(0,'DefaultAxesFontSize',20,'DefaultAxesFontName','Arial Cyr');
% data = readtable('poland_dbd.xlsx');
% % tworze animacje
% h = figure;
% filename = 'poland_dbd.gif';
% p = animatedline('LineWidth',10);
% % ustaliam zeby miec statyczne pole
% set(gca,'XLim',[1 43],'YLim',[0 25000]);
% % siatka
% grid on;
% % podpisy
% xlabel('Data','FontWeight', 'bold');
% ylabel('Liczba zakażeń','FontWeight', 'bold');
% title('Zakażenia w Polsce','FontSize', 20, 'Color', 'k', 'FontWeight', 'bold');
% % legenda
% legend({'Zakażenia'},'Location','northwest','Orientation','horizontal','FontSize', 20, 'FontWeight', 'bold')
% % petla do rysowania ramek
% set(gcf, 'Position', get(0, 'Screensize'));
% set(gca,'XTick',1:length(data.num),'XTickLabel',data.date);
% set(gca,'XTickLabelRotation',45)
% for i = 1:length(data.num)
%     if i <= 21
%         set(gca,'color',[.784+0.00657*i 1 .862]);
%         p.Color = [.0476*i 1 0.168-0.0039*i];
%     else
%         set(gca,'color',[1 1-0.00657*(i-22) .862]);
%         p.Color = [1. 1-0.0476*(i-22) 0.168-0.0039*i];
%     end
%     addpoints(p,data.num(i),data.total_cases(i));
%     drawnow 
%     frame = getframe(h); 
%     im = frame2im(frame); 
%     [imind,cm] = rgb2ind(im,256);
%     % zapis do gif
%     if i == 1 
%         imwrite(imind,cm,filename,'gif', 'Loopcount',inf,'DelayTime',0.1); 
%     else 
%         imwrite(imind,cm,filename,'gif','WriteMode','append','DelayTime',0.1); 
%     end   
% end
% imwrite(imind,cm,filename,'gif','WriteMode','append','DelayTime',2);

% clear;
% 
% % wczytuje dane
% data = readtable('europe.xlsx');
% 
% % wykres "5 państw Europy z największym wskażnikiem zakażeń na 1M mieszkańców"
% data = sortrows(data,{'cases_per_mil'},{'descend'});
% count = 5;
% sz = [count 2];
% varTypes= {'double','double'};
% varNames = {'num','cases'};
% data_temp = table('Size',sz,'VariableTypes',varTypes,'VariableNames',varNames);
% figure;
% set(gcf, 'Position', get(0, 'Screensize'));
% for i = 1:count
%     data.num(i) = i;
%     data_temp(i,1) = {i};
%     data_temp(i,2) = {data.cases_per_mil(i)};
%     bar(data_temp.num(i), data_temp.cases(i),'FaceColor',[.863 .078*i .235*i/2],...
%     'EdgeColor',[.698 .133 .133],'LineWidth',2);
%     hold on;
% end
% grid on;
% xlabel('Państwo','FontSize', 20, 'Color', 'k', 'FontWeight', 'bold');
% ylabel('Zakażenia','FontSize', 20, 'Color', 'k', 'FontWeight', 'bold');
% title('5 państw Europy z największym wskaźnikiem zakażeń na 1M mieszkańców',...
%     'FontSize', 20, 'Color', 'k', 'FontWeight', 'bold');
% xticks(1:count);
% ylim([0 max(data_temp.cases)*1.2]);
% set(gca,'color',[.98 .93 1],'XTick',1:count,'XTickLabel',data.country);

