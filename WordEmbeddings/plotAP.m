function [clusterIndices,purity,plotfig,datafig] = plotAP(mappedX2,foundWords,foundCategories,kernelMethod,vectors,vocab2cat,distance,subscript,showWindows,visible)
simM = squareform(pdist(vectors,'cosine'));
[pmin,pmax]=preferenceRange(simM);
clusterIndices=apcluster(simM,pmin,'plot','MAXITS','3000','CONVITS','1000','DAMPFACT','.8');
medoids=zeros(0,size(vectors,2));
for ptIdx=1:size(clusterIndices,1)
    if ptIdx==clusterIndices(ptIdx)
        medoids(size(medoids,1)+1,:) = vectors(ptIdx); 
    end
end
numCategories = size(medoids,1);
global ind;
[C,~,clusterIndices] = unique(clusterIndices);
[S,I] = sortrows(clusterIndices);
val=1:size(vectors,1);
ind = accumarray(S,val(I), [numCategories 1], @(x){x});

annotations = strrep(foundWords,'_',' ');
for annoIdx=1:size(annotations,1)
    categories = vocab2cat(foundWords{annoIdx,1});
    cats{annoIdx} = intersect(categories,foundCategories);
    category = '';
    for categoryIdx=1:size(cats{annoIdx},1)
        category = sprintf('%s %s',category,cats{annoIdx}{categoryIdx,1});
    end
    annotations{annoIdx} = [annotations{annoIdx},'_{' category '}'];
end

if (showWindows == 1 || showWindows==3)
    if ~visible
        plotfig=figure('Visible','off');
    else
        plotfig=figure;
    end
    hold on
    dcm_obj = datacursormode(plotfig);
    set(dcm_obj,'UpdateFcn',@senseUpdateFcn)
    set(dcm_obj, 'Enable','on')
    gscatter(mappedX2(:,1), mappedX2(:,2),clusterIndices ,[], 'ox+*sdv^<>ph',12)
    title(strcat('AP using ',distance,' distance ', kernelMethod));
    if subscript
        text(mappedX2(:,1),mappedX2(:,2),annotations, 'horizontal','left', 'vertical','bottom')
    else
        text(mappedX2(:,1),mappedX2(:,2),strrep(foundWords,'_',' '), 'horizontal','left', 'vertical','bottom')
    end
    hold off
end
purity = calcPurity(ind,cats);
d2c = distToCentroids(medoids,ind,'cosine',vectors);
pairs = dissimilarPairs(ind,'cosine',vectors,foundWords);

if (showWindows == 2 || showWindows==3)
    if ~visible
        datafig=figure('Visible','off');
    else
        datafig=figure;
    end
    hold on
    silhouette(vectors,clusterIndices,'cosine');
    annotation('textbox',[0.5,0.8,0.1,0.1],'String',['Total distance from medoid: ',num2str(d2c),char(10),'Purity: ',num2str(purity),char(10),'Most distant pairs: ',char(10), pairs]);
    title(strcat('AP using ',distance,' distance ', kernelMethod));
    hold off
end
