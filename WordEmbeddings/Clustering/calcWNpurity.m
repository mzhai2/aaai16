function [wnPurity] = calcWNpurity(clusters,cats)
total=0;
score=0;
for class=1:foundC
    for clusterIndex=1:size(clusters,1)
        cluster={1,clusterIndex};
        cluster = cell2mat(cluster);
        class = mode(cluster);
        tp = 0;
        fp = 0;
        tn = 0;
        for pt=1:size(cluster,2)
            if cluster{1,pt} == class
                tp = tp+1;
            else
                fp = fp+1;
            end
        end
        tn = size(cats,1)-size(cluster,2);

        score = score+sum(class==cluster(:));
        total = total+size(cluster,2);
    end
    purity=score/total;
end
return
% for each cluster compute top

% score=0;
% for clusterIndex=1:size(clusters,1)
%     cluster=clusters{clusterIndex};
%     wnSenses=cats(1,cluster);
%     topSense = mode(wnSenses);
%     score = score+sum(topSense==wnSenses(:));
% end
% wnPurity=score/size(cats,1);
% return