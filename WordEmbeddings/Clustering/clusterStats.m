function [lPurity,sPurity,dunnScore,datafig] = clusterStats(visible,showWindows,clusterIndices,vectors,numCategories,distM,vocab2cat,foundWords,centers,algorithm)
ind = calcInd(clusterIndices,vectors,numCategories); % ind stores the indices of the points in each cluster
lPurity = loosePurity(ind,vocab2cat);
sPurity = strictPurity(ind,vocab2cat);
d2c = distToCentroids(centers,ind,'cosine',vectors);
pairs = dissimilarPairs(ind,'cosine',vectors,foundWords);
dunnScore = dunns(numCategories,distM,clusterIndices);

if (showWindows == 2 || showWindows==3)
    if ~visible
        datafig=figure('Visible','off');
    else
        datafig=figure;
    end
    hold on
    silhouette(vectors,clusterIndices,'cosine');
    annotation('textbox',[0.5,0.8,0.1,0.1],'String',['Dunn Score: ',num2str(dunnScore),char(10),'Total distance from center: ',num2str(d2c),char(10),'Strict Purity: ',num2str(sPurity),char(10),'Loose Purity: ',num2str(lPurity),char(10),'Most distant pairs: ',char(10), pairs]);
    title(strcat(algorithm,' using ',distance,' distance'));
    hold off
end