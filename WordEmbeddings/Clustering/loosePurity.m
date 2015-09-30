function [purity] = loosePurity(ind,vocab2cat)
total=0;
score=0;
for clusterIndex=1:size(ind,1)
    cluster=ind{clusterIndex,1};
    categoryCount = 1;
    categoriesOfCluster=cell(size(cluster),1);
    for ptIdx=1:size(cluster)
        pt = cluster(ptIdx);
        categories = vocab2cat(row2vocab(pt));
        for cat=1:size(categories,1)
            categoriesOfCluster{ptIdx,categoryCount} = categories{cat,1};
            categoryCount = categoryCount+1;
        end
    end
    emptyIdx = cellfun(@isEmpty,categoriesOfCluster);
    categoriesOfCluster(emptyIdx)={''};
    [~,~,J] = uniqueRowsCA(categoriesOfCluster);
    [~,F] = mode(J);
    score = score+F;
    total = total+size(cluster,1);
end
purity=score/total;
return