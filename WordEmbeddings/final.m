% kmeansCosinePurity=zeros(50,1);
% kmedoidsCosinePurity=zeros(50,1);
% kmeansCosinePurityHypo=zeros(5,1);

for run = 1:10
    for N = 5:5:100
    %     load('data/NYTw2vSenseN');
        p = randperm(size(foundCategoriesC,1),N);
        newFoundCategories = foundCategoriesC(p);
        rows = cell(0);
        for catIdx=1:size(newFoundCategories,1)
            rows{catIdx,1} = cat2rows(newFoundCategories{catIdx,1});
        end

        rows=unique(cell2mat(rows),'stable');
        for rowIdx=1:size(rows,1)
            newFoundWords{rowIdx,1} = row2vocab(rows(rowIdx,1));
        end
        vectors = vectorsC(rows,:);
        foundCategories = unique(newFoundCategories,'stable');
        foundWords = unique(newFoundWords,'stable');
        numCategories = size(newFoundCategories,1);
        clear catIdx p words newFoundWords newFoundCategories
        DIST=distanceMatrix(vectors);
        DIST(DIST==0)=inf;
        DIST=min(DIST);
        para=5*mean(DIST);
        clear DIST
        disp('Performing PCA...');
    %     [kpcaMsimp, ~]=kPCA(vectors,100,'simple',para);
    %     [kpcaM, ~]=kPCA(vectors,10,'gaussian',para);

    %     mappedX2 = tsne(kpcaM, [], 2, 20);
        minR=N;maxR=N;
        subscript=true; showWindows=2; visible=true;

    %     [~, APcosinePurity,plotfig,datafig] = plotAP(mappedX2,foundWords,foundCategories,'',kpcaM,vocab2cat,'correlation',subscript,showWindows,visible);


        h=gobjects(14,maxR-1);
        for numClusters=N
    %         [~, kmedoidsPearsonPurity(numClusters-1),h(1,numClusters-1),h(2,numClusters-1)] = plotKmedoids(mappedX2,foundWords,foundCategories,'',vectors,numClusters,vocab2cat,'correlation',subscript,showWindows,visible);
    %         [~, kmedoidsSpearmanPurity(numClusters-1),h(3,numClusters-1),h(4,numClusters-1)] = plotKmedoids(mappedX2,foundWords,foundCategories,'',vectors,numClusters,vocab2cat,'spearman',subscript,showWindows,visible);
    %         [~, kmedoidsCosinePurity(numClusters-1),h(5,numClusters-1),h(6,numClusters-1)] = plotKmedoids(mappedX2,foundWords,foundCategories,'',vectors,numClusters,vocab2cat,'cosine',subscript,showWindows,visible);
    %         [~, kmeansPearsonPurity(numClusters-1),h(7,numClusters-1),h(8,numClusters-1)] = plotKmeans(mappedX2,foundWords,foundCategories,'',vectors,numClusters,vocab2cat,'correlation',subscript,showWindows,visible);
            [~, kmeansCosinePuritySyn(run,numClusters/5)] = plotKmeans(vectors,foundWords,foundCategories,'',vectors,N,vocab2cat,'cosine',subscript,showWindows,visible);
    %         [~, fcmSpearmanPurity(numClusters-1),h(11,numClusters-1),h(12,numClusters-1)] = plotFCM(mappedX2,foundWords,foundCategories,'',vectors,numClusters,vocab2cat,'spearman',subscript,showWindows,visible);
    %         [~, fcmCosinePurity(numClusters-1),h(13,numClusters-1),h(14,numClusters-1)] = plotFCM(mappedX2,foundWords,foundCategories,'',vectors,numClusters,vocab2cat,'cosine',subscript,showWindows,visible);
        end
    %     savePath = 'figures/simplified/';
    %     for figtype=10
    %         for numClusters=N
    %             switch figtype
    %                 case 1
    %                     savefig(h(figtype,numClusters),[savePath 'kmedoidsPearsonPlot' num2str(numClusters) '.fig'],'compact');
    %                 case 2
    %                     savefig(h(figtype,numClusters),[savePath 'kmedoidsPearsonData' num2str(numClusters) '.fig'],'compact');
    %                 case 3
    %                     savefig(h(figtype,numClusters),[savePath 'kmedoidsSpearmanPlot' num2str(numClusters) '.fig'],'compact');
    %                 case 4
    %                     savefig(h(figtype,numClusters),[savePath 'kmedoidsSpearmanData' num2str(numClusters) '.fig'],'compact');
    %                 case 5
    %                     savefig(h(figtype,numClusters),[savePath 'kmedoidsCosinePlot' num2str(numClusters) '.fig'],'compact');
    %                 case 6
    %                     savefig(h(figtype,numClusters),[savePath 'kmedoidsCosineData' num2str(numClusters) '.fig'],'compact');
    %                 case 7
    %                     savefig(h(figtype,numClusters),[savePath 'kmeansPearsonPlot' num2str(numClusters) '.fig'],'compact');
    %                 case 8
    %                     savefig(h(figtype,numClusters),[savePath 'kmeansPearsonData' num2str(numClusters) '.fig'],'compact');
    %                 case 9
    %                     savefig(h(figtype,numClusters),[savePath 'kmeansCosinePlot' num2str(numClusters) '.fig'],'compact');
    %                 case 10
    %                     savefig(h(figtype,numClusters),[savePath 'kmeansCosineData' num2str(numClusters) '.fig'],'compact');
    %                 case 11
    %                     savefig(h(figtype,numClusters),[savePath 'fcmSpearmanPlot' num2str(numClusters) '.fig'],'compact');
    %                 case 12
    %                     savefig(h(figtype,numClusters),[savePath 'fcmSpearmanData' num2str(numClusters) '.fig'],'compact');
    %                 case 13
    %                     savefig(h(figtype,numClusters),[savePath 'fcmCosinePlot' num2str(numClusters) '.fig'],'compact');
    %                 case 14
    %                     savefig(h(figtype,numClusters),[savePath 'fcmCosineData' num2str(numClusters) '.fig'],'compact');
    %             end
    %         end
    %     end
    %     purity = figure('Visible','off');
    %     x=minR:2:maxR;
    %     plot(x,kmedoidsPearsonPurity(x-1),x,kmedoidsSpearmanPurity(x-1),x,kmedoidsCosinePurity(x-1),x,kmeansPearsonPurity(x-1),x,kmeansCosinePurity(x-1),x,fcmSpearmanPurity(x-1),x,fcmCosinePurity(x-1));
    %     legend('kmedoids Pearson','kmedoids Spearman','kmedoids Cosine','kmeans Pearson','kmeans Cosine','fcm Spearman','fcm Cosine','Location','northwest');
    %     savefig(purity,[savePath 'purity.fig']);
    end
end