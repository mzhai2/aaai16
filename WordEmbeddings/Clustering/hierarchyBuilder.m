% load('H:\WordEmeddings\data\NYTw2v1500Kmeans');
% load('H:\WordEmeddings\data\NYTw2v'); 
M = zeros(size(clusterMap.keys,2),300);
nonrec = 0;
clusterKeys = clusterMap.keys;
for clusterIdx = 1:size(clusterKeys,2)
    words = clusterMap(clusterKeys{clusterIdx});
    T = zeros(size(words,1),300);
    for wordIdx = 1:size(words,1)
        word = words{wordIdx};
        if isKey(embeddingMap,word)
            T(wordIdx,:) = embeddingMap(word);
        else
            disp(word);
            nonrec = nonrec+1;
        end
    end
    M(clusterIdx,:) = mean(T);
end
disp(nonrec);
clusterID = naiveAgglomerative(M);
fout = fopen('H:\WordEmeddings\data\NYTw2v1500HKmeans.txt','w');
for clusterIdx = 1:size(clusterKeys,2)
	words = clusterMap(clusterKeys{clusterIdx});
    for wordIdx = 1:size(words,1)
        word = words{wordIdx};
        ID = clusterID(clusterIdx);
        fprintf(fout,'%s %s\n',ID{:},word);
    end
end
fclose(fout);