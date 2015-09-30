function [clusterIndices,purity,plotfig,datafig] = plotFCM(mappedX2,foundWords,kernelMethod,vectors,numCategories,vocab2cat,distance,subscript,showWindows,visible)
opts = [2;100;1e-5;1];
[centers,U,~] = fcm(vectors,numCategories,distance,opts);
[~, clusterIndices] = max(U);
global ind;
[S,I] = sortrows(clusterIndices');
val=1:size(vectors,1);
ind = accumarray(S,val(I), [numCategories 1], @(x){x});

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
    title(strcat('FCM using ',distance,' distance ', kernelMethod));
    annotations = createAnnotations(foundWords,vocab2cat);
    if subscript
        text(mappedX2(:,1),mappedX2(:,2),annotations, 'horizontal','left', 'vertical','bottom')
    else
        text(mappedX2(:,1),mappedX2(:,2),strrep(foundWords,'_',' '), 'horizontal','left', 'vertical','bottom')
    end
    hold off
end
purity = calcPurity(ind,cats);
d2c = distToCentroids(centers,ind,'cosine',vectors);
pairs = dissimilarPairs(ind,'cosine',vectors,foundWords);

if (showWindows == 2 || showWindows==3)
    if ~visible
        datafig=figure('Visible','off');
    else
        datafig=figure;
    end
    hold on
    silhouette(vectors,clusterIndices,'cosine');
    annotation('textbox',[0.5,0.8,0.1,0.1],'String',['Total distance from center: ',num2str(d2c),char(10),'Purity: ',num2str(purity),char(10),'Most distant pairs: ',char(10), pairs]);
    title(strcat('FCM using ',distance,' distance ', kernelMethod));
    hold off
end
