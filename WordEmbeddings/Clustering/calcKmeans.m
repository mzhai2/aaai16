function [clusterIndices,centers,lPurity,sPurity,dunnScore,plotfig,datafig] = calcKmeans(mappedX2,foundWords,vectors,numCategories,maxCats,vocab2cat,distM,distance,subscript,showWindows,visible,savePath)

opts = statset('Display','final','UseParallel',true);
[clusterIndices, centers] = kmeans(vectors,numCategories,'Distance',distance,'Replicates',5,'Options',opts);
save(savePath,clusterIndices,centers,'-v7.3');
plotfig = clusterPlot(visible,showWindows,mappedX2,clusterIndices,subscript,'kmeans');
[lPurity,sPurity,dunnScore,datafig] = clusterStats(visible,showWindows,clusterIndices,vectors,numCategories,ind,distM,vocab2cat,maxCats,foundWords,centers,'kmeans');
save(savePath,lPurity,sPurity,dunnScore,datafig,'-append');
