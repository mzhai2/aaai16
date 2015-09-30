%% OPTIONAL getting biggest categories e.g. words with the most synonyms or senses with largest synsets
m = sense;
fromTopK=200;
top = cell(length(m),fromTopK); % stores synonym sets
baseWords = m.keys;
values = m.values;
lengthIdx = zeros(2,length(m));
for v=1:length(m)
    lengthIdx(1,v) = length(values{v});
    lengthIdx(2,v) = v;
end
lengthIdx = sortrows(lengthIdx');
% get top k
B = cell(fromTopK,2);
for k=0:fromTopK-1
    idx = lengthIdx(end-k,2);
    topKword = baseWords{1,idx};
    B{k+1,1} = m(topKword);
    B{k+1,2} = topKword;
end

%% kmeans on visualization
% figure
% hold on
% % numDims = 2; perplexity = 50;
% % mappedX2 = tsne(kpcaM, [], numDims, perplexity);
% gscatter(mappedX2(:,1), mappedX2(:,2),group ,[], 'ox+*sdv^<>ph',12)
% text(mappedX2(:,1), mappedX2(:,2), foundWords, 'horizontal','left', 'vertical','bottom')
% columnlegend(3, foundCategories, 'Location', 'NorthWest', 'boxoff');
% opts = statset('Display','final');
% [clusterIndices,Centroids] = kmeans(mappedX2,numCategories*2,'Replicates',10,'Options',opts);
% title('k-means on visualization');
% for category=1:numCategories*2
%     index = find(clusterIndices==category);
%     line(mappedX2(index,1),mappedX2(index,2),'linestyle',':','marker','None','LineWidth',1.3,'color', rand(1,3));
% end
% hold off
% figure
% silhouette(M,clusterIndices,'cosine')
% title('k-means on visualization');

%% fuzzy c-means on 2d for visualization
% numDims = 2; perplexity = 50;
% mappedX2 = tsne(kpcaM, [], numDims, perplexity);
% figure
% gscatter(mappedX2(:,1), mappedX2(:,2),group ,[], 'ox+*sdv^<>ph',12)
% text(mappedX2(:,1), mappedX2(:,2), foundWords, 'horizontal','left', 'vertical','bottom')
% columnlegend(3, foundCategories, 'Location', 'NorthWest', 'boxoff');
% [~,U,~] = fcm(mappedX2, numCategories);
% maxU = max(U);
% title('fc-means on visualization');
% for i=1:size(U,1)
%     index = find(U(i,:)==maxU);
%     line(mappedX2(index,1),mappedX2(index,2),'linestyle',':','marker','None','LineWidth',1.3,'color', rand(1,3));
% end