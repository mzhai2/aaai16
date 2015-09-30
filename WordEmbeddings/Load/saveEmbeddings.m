embeddingName = 'C:\Users\Mike\Documents\MATLAB\WordEmeddings\Tw2v.txt';
embeddingID = fopen(embeddingName);
nCols = 300;
format = ['%s ' repmat('%f ', [1 nCols])];
C = textscan(embeddingID, format);
fclose(embeddingID);
words = C(1,1);
words = words{:};
embedding = cell2mat(cat(1,C(2:end)));
embeddingMap = containers.Map;
for i=1:length(words)
    embeddingMap(char(words(i))) = embedding(i,:);
end

save('Tw2v.mat', 'embeddingMap', 'embedding', '-v7.3')