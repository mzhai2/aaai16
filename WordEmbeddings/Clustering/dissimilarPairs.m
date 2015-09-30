function pairs = dissimilarPairs(ind,distance,vectors,foundWords)
% for each cluster, sum the distances from the medoid
pairs = '';
tot=0;
single=0;
for clusterIdx=1:size(ind,1)
    cluster = ind{clusterIdx};
    clusterVectors = zeros(size(cluster,1),size(vectors,2));
    for ptIdx=1:size(cluster,1)
        pt=cluster(ptIdx,1);
        clusterVectors(ptIdx,:) = vectors(pt,:);
    end
    if size(clusterVectors,1) > 1
        dists = squareform(pdist(clusterVectors,distance));
        [None maxIdx] = max(dists(:));
        [m,n] = ind2sub(size(dists),maxIdx);
        numEdges = ((size(cluster,1)-1)*size(cluster,1))/2;
        tri = tril(dists);
        inter=sum(tri(:))/numEdges;
        tot = tot+inter;
        pairs = sprintf('%s%i %s-%s %0.2f%s',pairs,clusterIdx,strrep(foundWords{cluster(m,1),1},'_',' '),strrep(foundWords{cluster(n,1),1},'_',' '),inter,char(10));
    else
    	pairs = sprintf('%s%i singleton cluster%s',pairs,clusterIdx,char(10));
        single = single+1;
    end
end
tot = tot/(size(ind,1)-single);
pairs = sprintf('%sAverage distance within clusters %.2f',pairs,tot);
return