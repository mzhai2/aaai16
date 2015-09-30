function [clusterIndices,medoids,lPurity,sPurity,dunnScore,plotfig,datafig] = calcKmedoids(mappedX2,foundWords,vectors,numCategories,maxCats,vocab2cat,distM,distance,subscript,showWindows,visible,savePath)

opts = statset('Display','final','UseParallel',true);
[clusterIndices, medoids] = kmedoids(vectors,numCategories,'Distance',distance,'Replicates',5,'Options',opts);
save(savePath,clusterIndices,medoids,'-v7.3');
plotfig = clusterPlot(visible,showWindows,mappedX2,clusterIndices,subscript,'kmedoids');
[lPurity,sPurity,dunnScore,datafig] = clusterStats(visible,showWindows,clusterIndices,vectors,numCategories,ind,distM,vocab2cat,maxCats,foundWords,medoids,'kmedoids');
save(savePath,lPurity,sPurity,dunnScore,datafig,'-append');
