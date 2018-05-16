clear;
clc;
Data = xlsread('Data1.xlsx');
GP_y = xlsread('DataGP_y1.xlsx');
GP_cov = xlsread('DataGP_cov1.xlsx');
% x2 = 0.3;
x1 = zeros(20,1);
True_y1 = zeros(20,1);
GP_y1 = zeros(20,3);
Sim5000_y1 = zeros(20,1);
for i = 1:20
    x1(i) = Data(20*(i-1)+11,1);
    Sim5000_y1(i) = Data(20*(i-1)+11,8);
    True_y1(i) = Data(20*(i-1)+11,4);
    GP_y1(i,1) = GP_y(20*(i-1)+11,4)-1.96*GP_cov(20*(i-1)+11,4);
    GP_y1(i,2) = GP_y(20*(i-1)+11,4);
    GP_y1(i,3) = GP_y(20*(i-1)+11,4)+1.96*GP_cov(20*(i-1)+11,4);
end
figure(1)
hold on;
plot(x1,[True_y1,Sim5000_y1],'LineWidth',1.2);
plot(x1,GP_y1,'LineWidth',1.2);
% x1 = 0.3;
x2 = zeros(20,1);
True_y2 = zeros(20,1);
GP_y2 = zeros(20,3);
for i = 1:20
    x2(i) = Data(200+i,2);
    True_y2(i) = Data(200+i,4);
    GP_y2(i,1) = GP_y(200+i,4)-1.96*GP_cov(200+i,4);
    GP_y2(i,2) = GP_y(200+i,4);
    GP_y2(i,3) = GP_y(200+i,4)+1.96*GP_cov(200+i,4);
end
figure(2)
hold on;
plot(x2,True_y2,'LineWidth',1.2);
plot(x2,GP_y2,'LineWidth',1.2);
% plot(values1(1,:),values1(2,:),'LineWidth',1.2);
% plot(z,Test(:,3),'--','LineWidth',1.3);
% values2 = spcrv([[z(1) z z(end)];[f22(1) f22 f22(end)]],3);
% plot(values2(1,:),values2(2,:),'LineWidth',1.2);
% box off;
% axis([0 60000 0 0.08]);
% set(gca,'xtick',0:1000:60000);
% set(gca,'xticklabel',{'','1000','','','4000','','','7000','','','10000','',''...
%     ,'13000','','','16000','','','19000','','','22000','','','25000','','','28000'...
%     ,'','','31000','','','34000','','','37000','','','40000','','','43000','',''...
%     ,'46000','','','49000','','','52000','','','55000','','','58000','',''});
% xtl=get(gca,'XTickLabel');
% set(gca,'ytick',0:0.01:0.08);
% set(gca,'yticklabel',{'0','0.01','0.02','0.03','0.04','0.05','0.06','0.07','0.08'});
% xt=get(gca,'XTick');
% yt=get(gca,'YTick');
% ytextp=(yt(1)-0.2*(yt(2)-yt(1)))*ones(1,length(xt));
% text(xt,ytextp,xtl,'HorizontalAlignment','right','rotation',90);
% set(gca,'xticklabel','');
% line([0 60000],[0.05 0.05],'linestyle',':');
% line([1900 1900],[0 0.05],'linestyle',':');
% legend('upperbound','actual value','lowbound','threhold','Location','North','orientation','horizontal');
% xlabel({'';'';'';'T (ms)'})
% ylabel('R1','position',[-6000 0.04],'Rotation',0);