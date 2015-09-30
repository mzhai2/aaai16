normA = normrnd(16,5,150,1);
normB = normrnd(8,2,150,1);
normC = normrnd(2,1,150,1);
normD = normrnd(1,3,150,1);
mix = cat(1,normA,normB,normC,normD);
% figure
% histfit(mix,10,'normal')
% figure
% histfit(mix,10,'kernel')
% figure
% histogram(mix,50)
% figure
% histogram(mix,100)

% histogram(normA)
% histogram(normB)
% pd_kernel = fitdist(mix, 'Kernel','Kernel','normal','width',.1);
pd_kernel = fitdist(mix, 'Kernel','Kernel','normal');
pd_normal = fitdist(mix, 'normal');
x_values = -10:1:50;

pdf_kernel = pdf(pd_kernel,x_values);
pdf_normal = pdf(pd_normal,x_values);

figure
plot(x_values,pdf_kernel,'Color','b','LineWidth',2);
hold on;
plot(x_values,pdf_normal,'Color','r','LineStyle',':','LineWidth',2);
legend('Kernel Distribution','Normal Distribution','Location','SouthEast');
hold off;

mixB = cat(2,normA,normB,normC,normD);
N = 500;                        %Number of samples
[yv,tv,optwv,gs,cs] = ssvkernel(mix);

% The locally adaptive bandwidth at time tv is written in optwv.
subplot(1,1,1:2);
hold on;
plot(tv,yv,'r-','LineWidth',2);
subplot(1,1,3);
hold on;
plot(tv,optwv,'r ','LineWidth',2);
drawnow;
ylabel('density');
subplot(1,1,3);
hold on; 
plot(t,optw*ones(1,L),'b-','LineWidth',2);
set(gca,'XLim',[min(t) max(t)]);
ylabel('bandwidth');
drawnow;