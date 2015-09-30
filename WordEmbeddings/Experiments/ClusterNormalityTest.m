% clusterMap = cluster2map('H:\WordEmeddings\data\kmeans\NYTw2v15000.txt');
% save('H:\WordEmeddings\data\NYTw2v15000Kmeans','clusterMap');

load('/Users/Mike/Desktop/WordEmbeddings/data/NYTw2v1500Kmeans');
load('/Users/Mike/Desktop/WordEmbeddings/data/NYTw2v');

ad = zeros(0);
ks = zeros(0);
sw = zeros(0);
jb = zeros(0);
ll = zeros(0);
tested = 0;

for clusterIdx = 1:size(clusterMap.keys,2)
    clusterKeys = clusterMap.keys;
    words = clusterMap(clusterKeys{clusterIdx});
    M = zeros(0,300);
    for wordIdx = 1:size(words,1)
        word = words{wordIdx};
        if isKey(embeddingMap,word)
            M = vertcat(M,embeddingMap(word));
        end
    end
    if (size(M,1)>3)
        center = mean(M);
        M = pdist2(M,center,'cosine');
        ks(size(ks,1)+1,:)=kstest(M);
        ad(size(ad,1)+1,:)=adtest(M);
        sw(size(ad,1)+1,:)=swtest(M);
        jb(size(ad,1)+1,:)=jbtest(M);
        ll(size(ad,1)+1,:)=lillietest(M);
        tested = tested + 1;
    end
end
tested
sum(ad)
sum(ks)
sum(sw)
sum(jb)
sum(ll)
figure
imagesc(ks);
figure
imagesc(ad);
figure
imagesc(sw);
figure
imagesc(jb);
figure
imagesc(ll);
