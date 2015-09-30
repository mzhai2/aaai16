function score = distToCentroids(centroids,ind,distance,vectors)
% for each cluster, sum the distances from the medoid
score = zeros(size(ind,1),1);
for clusterIdx=1:size(ind,1)
    cluster = ind{clusterIdx};
    medoid = centroids(clusterIdx,:);
    clusterVectors = zeros(size(cluster,1),size(vectors,2));
    for ptIdx=1:size(cluster,1)
        pt=cluster(ptIdx,1);
        clusterVectors(ptIdx,:) = vectors(pt,:);
    end
    
    score(clusterIdx) = sum(pdist2(medoid,clusterVectors,distance))/(size(clusterVectors,1)+1);
end
score = sum(score);
return