function [clusterIndices,lPurity,sPurity,dunnScore,plotfig,datafig] = calcFCM(mappedX2,foundWords,vectors,numCategories,maxCats,vocab2cat,distM,distance,subscript,showWindows,visible,savePath)

opts = [2;100;1e-5;1];
[centers,U,~] = fcm(vectors,numCategories,distance,opts);
[~, clusterIndices] = max(U);
save(savePath,clusterIndices,centers,'-v7.3');
plotfig = clusterPlot(visible,showWindows,mappedX2,clusterIndices,subscript,'FCM');
[lPurity,sPurity,dunnScore,datafig] = clusterStats(visible,showWindows,clusterIndices,vectors,numCategories,ind,distM,vocab2cat,maxCats,foundWords,centers,'FCM');
save(savePath,lPurity,sPurity,dunnScore,datafig,'-append');