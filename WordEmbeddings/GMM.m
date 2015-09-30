% gaussian mixture model
GMModel = fitgmdist(embedding(1:1000,:),2,'RegularizationValue',0.1);
[~,score] = pca(embedding(1:1000,:),'NumComponents',2);
rng(1)
rand(1);
options = statset('MaxIter',1000);
for j = 4:12
    GMModels{j} = fitgmdist(score,j,'Options',options);
    fprintf('\n GM Mean for %i Component(s)\n',j)
    Mu = GMModels{j}.mu
end
figure
for j = 4:12
    subplot(4,4,j)
    scatter(score(:,1),score(:,2))
    
    h = gca;
    hold on
    ezcontour(@(x1,x2)pdf(GMModels{j},[x1 x2]),...
        [h.XLim h.YLim],100)
    title(sprintf('GM Model - %i Component(s)',j));
    xlabel('1st principal component');
    ylabel('2nd principal component');
    hold off
end
g = legend;
set(g,'Position',[0.7,0.25,0.1,0.1])

[~,score] = pca(embedding(1:100000,:),'NumComponents',3);

% regularized GMM
options = statset('MaxIter',500);
kstart=21;
kend=21;
GMModels=cell(1,kend-kstart);
AICf=zeros(1,kend-kstart);
AICd=zeros(1,kend-kstart);
figure
for k = kstart:kend
    GMModelsf{k-kstart+1} = fitgmdist(embedding(1:100000,:),k,'Options',options,'RegularizationValue',0.01);
    GMModelsd{k-kstart+1} = fitgmdist(embedding(1:100000,:),k,'Options',options,'CovarianceType','diagonal','RegularizationValue',0.01);
    AICf(k-kstart+1)= GMModelsf{k-kstart+1}.AIC
    AICd(k-kstart+1)= GMModelsd{k-kstart+1}.AIC
end
subplot(1,2,1)
plot(AICf)
subplot(1,2,2)
plot(AICd)
[minAICf,numComponentsf] = min(AICf);
[minAICd,numComponentsd] = min(AICd);

numComponentsf
numComponentsd

BestModelf = GMModelsf{numComponentsf}
BestModeld = GMModelsd{numComponentsd}