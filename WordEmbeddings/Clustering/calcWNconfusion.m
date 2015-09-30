function [wnConfusion] = calcWNconfusion(clusters,vocab2cat)
wnConfusion = cell(1,size(clusters,2));
for clusterIndex=1:size(clusters,2)
    cluster=clusters{1,clusterIndex};
    % clusterSenses=wnClass(cluster,:);
    for w=1:size(cluster,1)
    	clusterSenses=vocab2cat;
    end
    wnConfusion{1,clusterIndex}={sort(unique(clusterSenses)) countmember(sort(unique(clusterSenses)),clusterSenses)};
end
return