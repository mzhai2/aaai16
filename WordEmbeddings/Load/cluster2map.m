function cluster = cluster2map(filePath)
fid = fopen(filePath);
cluster = containers.Map;
curline = fgetl(fid);
while ischar(curline)
    C = strsplit(curline);
    clusterID = C{:,1};
    word = C{:,2};
    if isKey(cluster,clusterID)
        existingWords = cluster(clusterID);
        cluster(clusterID) = vertcat(existingWords,word);
    else
        cluster(clusterID) = {word};
    end
    curline = fgetl(fid);
end