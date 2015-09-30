function ind = calcInd(clusterIndices,numClusters)
% returns a cell array with each cell representing a cluster and containing
% the indices of the represented cluster
[S,I] = sortrows(clusterIndices); % S is the sorted result, I are the indices
ind = accumarray(S,I', [numClusters 1], @(x){x});
return