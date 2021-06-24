set(0,'DefaultAxesFontSize',20,'DefaultAxesFontName','Arial Cyr');


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
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


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% clear
% 
% % wczytuje dane
% data = readtable('europe.xlsx');
% % wykres "5 państw Europy z najmniejszym wskażnikiem zakażeń na 1M mieszkańców"
% data = sortrows(data,{'cases_per_mil'},{'ascend'});
% count = 5;
% sz = [count 2];
% varTypes= {'double','double'};
% varNames = {'num','cases'};
% data_temp = table('Size',sz,'VariableTypes',varTypes,'VariableNames',varNames);
% set(gcf, 'Position', get(0, 'Screensize'));
% for i = 1:count
%     data.num(i) = i;
%     data_temp(i,1) = {i};
%     data_temp(i,2) = {data.cases_per_mil(i)};
%     bar(data_temp.num(i), data_temp.cases(i),'FaceColor',[.863 .5/(0.9*i) .7/(0.9*i)],...
%     'EdgeColor',[.698 .133 .133],'LineWidth',2);
%     hold on;
% end
% grid on;
% xlabel('Państwo','FontSize', 20, 'Color', 'k', 'FontWeight', 'bold');
% ylabel('Zakażenia','FontSize', 20, 'Color', 'k', 'FontWeight', 'bold');
% title('5 państw Europy z najmniejszym wskaźnikiem zakażeń na 1M mieszkańców',...
%     'FontSize', 20, 'Color', 'k', 'FontWeight', 'bold');
% xticks(1:count);
% ylim([0 max(data_temp.cases)*1.2]);
% set(gca,'color',[.98 .93 1],'XTick',1:count,'XTickLabel',data.country);


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% clear
% 
% data = readtable('continents.xlsx');
% 
% data = sortrows(data,{'cases_per_mil'},{'descend'});
% set(gcf, 'Position', get(0, 'Screensize'));
% for i = 1:length(data.num)
%     A = data.cases_per_mil(i)*4;
%     geoscatter(data.lat(i),data.lon(i),A,'o','MarkerEdgeColor','b','MarkerFaceColor',[.863 .078*i .235*i/2],'LineWidth',1);
%     if i == 1
%         text(data.lat(i)+0.1,data.lon(i)-5,{data.cases_per_mil(i)},'Color','black','FontSize',20/log(i+1),'FontWeight', 'bold');
%     else
%         text(data.lat(i)+0.1,data.lon(i)-2,{data.cases_per_mil(i)},'Color','black','FontSize',20/log(i+1),'FontWeight', 'bold');  
%     end
%     hold on;
% end
% geobasemap landcover;
% title('Liczba zakażeń na kontynentach świata na 1M mieszkańców',...
%       'FontSize', 30, 'Color', 'k', 'FontWeight', 'bold');


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clear;
data = readtable('poland_dbd.xlsx');
% tworze animacje
h = figure;
filename = 'poland_dbd.gif';
p = animatedline('LineWidth',10);
% ustaliam zeby miec statyczne pole
set(gca,'XLim',[1 43],'YLim',[0 25000]);
% siatka
grid on;
% podpisy
xlabel('Data','FontWeight', 'bold');
ylabel('Liczba zakażeń','FontWeight', 'bold');
title('Zakażenia w Polsce','FontSize', 20, 'Color', 'k', 'FontWeight', 'bold');
% legenda
legend({'Zakażenia'},'Location','northwest','Orientation','horizontal','FontSize', 20, 'FontWeight', 'bold')
% petla do rysowania ramek
set(gcf, 'Position', get(0, 'Screensize'));
set(gca,'XTick',1:length(data.num),'XTickLabel',data.date);
set(gca,'XTickLabelRotation',45)
for i = 1:length(data.num)
    if i <= 21
        set(gca,'color',[.784+0.00657*i 1 .862]);
        p.Color = [.0476*i 1 0.168-0.0039*i];
    else
        set(gca,'color',[1 1-0.00657*(i-22) .862]);
        p.Color = [1. 1-0.0476*(i-22) 0.168-0.0039*i];
    end
    addpoints(p,data.num(i),data.total_cases(i));
    drawnow 
    frame = getframe(h); 
    im = frame2im(frame); 
    [imind,cm] = rgb2ind(im,256);
    % zapis do gif
    if i == 1 
        imwrite(imind,cm,filename,'gif', 'Loopcount',inf,'DelayTime',0.1); 
    else 
        imwrite(imind,cm,filename,'gif','WriteMode','append','DelayTime',0.1); 
    end   
end
imwrite(imind,cm,filename,'gif','WriteMode','append','DelayTime',2);


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% clear;
% 
% % wczytuje dane
% data = readtable('poland_dbd.xlsx');
% 
% % wykres "5 państw Europy z największym wskażnikiem zakażeń na 1M mieszkańców"
% count = length(data.num);
% figure;
% set(gcf, 'Position', get(0, 'Screensize'));
% for i = 1:count
%     bar(data.num(i), data.new_cases(i),'FaceColor',[.863 .078 .235],...
%     'EdgeColor',[.698 .133 .133],'LineWidth',2);
%     hold on;
% end
% grid on;
% xlabel('Data','FontSize', 20, 'Color', 'k', 'FontWeight', 'bold');
% ylabel('Zakażenia','FontSize', 20, 'Color', 'k', 'FontWeight', 'bold');
% title('Nowe przypadki w Polsce',...
%     'FontSize', 20, 'Color', 'k', 'FontWeight', 'bold');
% xticks(1:count);
% ylim([0 max(data.new_cases)*1.2]);
% xtickangle(90);
% set(gca,'color',[.98 .93 1],'XTick',1:count,'XTickLabel',data.date);


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% clear;
% set(gcf, 'Position', get(0, 'Screensize'));
% 
% woj = shaperead('Województwa.shp','UseGeoCoords',true);
% data = readtable('polska_woj.xlsx');
% 
% for i=1:length(woj)
%     woj(i).cases = data.cases(i);
% end
% 
% faceColors = makesymbolspec('Polygon',...
%     {'cases',[0 500],'FaceColor',[1 0.862-0.172*0 0.862-0.172*0]},...
%     {'cases',[501 1000],'FaceColor',[1 0.862-0.172*1 0.862-0.172*1]},...
%     {'cases',[1001 1500],'FaceColor',[1 0.862-0.172*2 0.862-0.172*2]},...
%     {'cases',[1501 2000],'FaceColor',[1 0.862-0.172*3 0.862-0.172*3]},...
%     {'cases',[2001 2500],'FaceColor',[1 0.862-0.172*4 0.862-0.172*4]},...
%      {'cases',[2500 inf],'FaceColor',[1 0.862-0.172*5 0.862-0.172*5]});
% 
% geoshow(worldmap([48.7 55],[13 30]),woj,'DisplayType','polygon','SymbolSpec',faceColors);
% title('Zakażenia w Polsce',...
%     'FontSize', 20, 'Color', 'k', 'FontWeight', 'bold');


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% clear;
% set(gcf, 'Position', get(0, 'Screensize'));
% 
% woj = shaperead('Województwa.shp','UseGeoCoords',true);
% data = readtable('polska_woj.xlsx');
% 
% for i=1:length(woj)
%     woj(i).deaths = data.deaths(i);
% end
% 
% faceColors = makesymbolspec('Polygon',...
%     {'deaths',[0 25],'FaceColor',[0.882-0.220*0 0.882-0.220*0 0.882-0.220*0]},...
%     {'deaths',[26 50],'FaceColor',[0.882-0.220*1 0.882-0.220*1 0.882-0.220*1]},...
%     {'deaths',[51 100],'FaceColor',[0.882-0.220*2 0.882-0.220*2 0.882-0.220*2]},...
%     {'deaths',[101 200],'FaceColor',[0.882-0.220*3 0.882-0.220*3 0.882-0.220*3]},...
%      {'deaths',[201 inf],'FaceColor',[0.882-0.220*4 0.882-0.220*4 0.882-0.220*4]});
% 
% geoshow(worldmap([48.7 55],[13 30]),woj,'DisplayType','polygon','SymbolSpec',faceColors);
% title('Zgony w Polsce',...
%     'FontSize', 20, 'Color', 'k', 'FontWeight', 'bold');



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% clear;
% set(gcf, 'Position', get(0, 'Screensize'));
% 
% S = shaperead('ne_10m_admin_0_countries.shp');
% mapshow(S,'LineStyle',':','FaceColor',[1 1 0.686]);
% data = readtable('europe.xlsx');
% 
% for i = 1:length(S)
%     for j = 1:length(data.num)
%         if i == data.ID(j)
%             tmp = str2double(data.HCI(j));
%             if tmp>50 && tmp<55
%                 mapshow(S(i),'FaceColor',[0 1 0])
%             elseif tmp>=55 && tmp<60
%                 mapshow(S(i),'FaceColor',[0 1-0.145*1 0])
%             elseif tmp>=60 && tmp<65
%                 mapshow(S(i),'FaceColor',[0 1-0.145*2 0])
%             elseif tmp>=65 && tmp<70
%                 mapshow(S(i),'FaceColor',[0 1-0.145*3 0])
%             elseif tmp>=70 && tmp<75
%                 mapshow(S(i),'FaceColor',[0 1-0.145*4 0])
%             elseif tmp>=75
%                 mapshow(S(i),'FaceColor',[0 1-0.145*5 0])
%             end
%         end
%     end
% end
% 
% title('Państwa Europy (Health Care Index)',...
%     'FontSize', 20, 'Color', 'k', 'FontWeight', 'bold');
% rectangle('Position',[-23 40 5 3],'Curvature',0.2,'FaceColor',[0 1 0],...
%             'LineWidth',1,'EdgeColor',[0 0 0]);
% rectangle('Position',[-23 50 5 3],'Curvature',0.2,'FaceColor',[0 1-0.145*5 0],...
%             'LineWidth',1,'EdgeColor',[0 0 0]);
% text(-21.5,41.5,'50','Color','black','FontSize',30,'FontWeight','bold'); 
% text(-21.5,51.5,'80','Color','white','FontSize',30,'FontWeight','bold');


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% clear;
% set(gcf, 'Position', get(0, 'Screensize'));
% 
% S = shaperead('ne_10m_admin_0_countries.shp');
% mapshow(S,'LineStyle',':','FaceColor',[1 0.7 0.7])
% data = readtable('europe.xlsx');
% 
% for i = 1:length(S)
%     for j = 1:length(data.num)
%         if i == data.ID(j)
%             tmp = data.deaths_per_mil(j);
%             if tmp<50
%                 mapshow(S(i),'FaceColor',[0.882-0.220*0 0.882-0.220*0 0.882-0.220*0])
%             elseif tmp>=50 && tmp<150
%                 mapshow(S(i),'FaceColor',[0.882-0.220*1 0.882-0.220*1 0.882-0.220*1])
%             elseif tmp>=150 && tmp<400
%                 mapshow(S(i),'FaceColor',[0.882-0.220*2 0.882-0.220*2 0.882-0.220*2])
%             elseif tmp>=400 && tmp<800
%                 mapshow(S(i),'FaceColor',[0.882-0.220*3 0.882-0.220*3 0.882-0.220*3])
%             elseif tmp>=800
%                 mapshow(S(i),'FaceColor',[0.882-0.220*4 0.882-0.220*4 0.882-0.220*4])
%             end
%         end
%     end
% end
% 
% title('Zgony w krajach Europy na 1M mieszkańców',...
%     'FontSize', 20, 'Color', 'k', 'FontWeight', 'bold');
% rectangle('Position',[-23 40 8 3],'Curvature',0.2,'FaceColor',[0.882-0.220*0 0.882-0.220*0 0.882-0.220*0],...
%             'LineWidth',1,'EdgeColor',[1 0 0]);
% rectangle('Position',[-23 44 8 3],'Curvature',0.2,'FaceColor',[0.882-0.220*1 0.882-0.220*1 0.882-0.220*1],...
%             'LineWidth',1,'EdgeColor',[1 0 0]);
% rectangle('Position',[-23 48 8 3],'Curvature',0.2,'FaceColor',[0.882-0.220*2 0.882-0.220*2 0.882-0.220*2],...
%             'LineWidth',1,'EdgeColor',[1 0 0]);
% rectangle('Position',[-23 52 8 3],'Curvature',0.2,'FaceColor',[0.882-0.220*3 0.882-0.220*3 0.882-0.220*3],...
%             'LineWidth',1,'EdgeColor',[1 0 0]);
% rectangle('Position',[-23 56 8 3],'Curvature',0.2,'FaceColor',[0.882-0.220*4 0.882-0.220*4 0.882-0.220*4],...
%             'LineWidth',1,'EdgeColor',[1 0 0]);
% text(-21.5,41.5,'0-50','Color','black','FontSize',30,'FontWeight','bold'); 
% text(-21.5,45.5,'50-150','Color','white','FontSize',30,'FontWeight','bold');
% text(-21.5,49.5,'150-400','Color','black','FontSize',30,'FontWeight','bold'); 
% text(-21.5,53.5,'400-800','Color','white','FontSize',30,'FontWeight','bold');
% text(-21.5,47.5,'>800','Color','black','FontSize',30,'FontWeight','bold'); 


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% clear;
% set(gcf, 'Position', get(0, 'Screensize'));
% 
% data = readtable('europe.xlsx');
% n = length(data.num);
% xy = 0;
% x = 0;
% y = 0;
% x2 = 0;
% 
% for i=1:n
%    xy = xy + data.cases_per_mil(i) * str2double(data.average_age(i));
%    x = x + data.cases_per_mil(i);
%    y = y + str2double(data.average_age(i));
%    x2 = x2 + str2double(data.average_age(i))^2;
% end
% 
% b = (n*xy - x*y)/(n*x2 - x^2);
% a = y/n - b*(x/n);
% xp = [35 50];
% yp = a * xp + b;
% 
% plot(xp,yp,'LineWidth',5,'Color','r');
% hold on;
% plot(str2double(data.average_age), data.cases_per_mil,'ob');
% 
% set(gca,'color',[.98 .93 1]);
% grid on;
% xlabel('Średni wiek','FontWeight', 'bold');
% ylabel('Zakażenia','FontWeight', 'bold');
% title('Korelacja liczby zakażeń na 1M i średniego wieku mieszkańców w krajach Europy','FontSize', 20, 'Color', 'k', 'FontWeight', 'bold');
% legend({' Korelacja'},'Location','northwest','Orientation','horizontal','FontSize',20,'FontWeight','bold')










