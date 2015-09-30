function [purity] = calcPurity(ind,cats)
total=0;
score=0;
for clusterIndex=1:size(ind,1)
    cluster=ind{clusterIndex,1};
    categoriesOfCluster=cell(1,size(cluster,1));
    for ptIdx=1:size(cluster)
        pt = cluster(ptIdx);
        categories = cats{pt};
        catsStr = '';
        for ptCatsIdx=1:size(categories)
            catsStr = [catsStr ' ' categories{ptCatsIdx,1}];
        end
        categoriesOfCluster{ptIdx} = catsStr;
    end
    [clusterCats,~,catMap] = unique(categoriesOfCluster);
    [M F] = mode(catMap);
    score = score+F;
    total = total+size(cluster,1);
end
purity=score/total;
return