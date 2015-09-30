function [purity] = strictPurity(ind,vocab2cat,maxCats)
total=0;
score=0;
for clusterIndex=1:size(ind,1)
    cluster=ind{clusterIndex,1};
    categoriesOfCluster=cell(size(cluster),maxCats);
    for ptIdx=1:size(cluster)
        pt = cluster(ptIdx);
        categories = vocab2cat(row2vocab(pt));
        categoriesOfCluster{ptIdx,:} = categories';
    end
    emptyIdx = cellfun(@isEmpty,categoriesOfCluster);
    categoriesOfCluster(emptyIdx)={''};
    [~,~,J] = uniqueRowsCA(categoriesOfCluster);

    [~, F] = mode(J);
    score = score+F;
    total = total+size(cluster,1);
end
purity=score/total;
return