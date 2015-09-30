function [M,distM,foundWords,foundCategories,numCategories,vocab2cat,vocab2row,cat2rows,row2vocab,maxCats] = matrixMapBuilder(wordClassCells, embeddingMap)
M = zeros(0,300);
vocab2cat = containers.Map;
vocab2row = containers.Map;
cat2rows = containers.Map;
foundCategories = cell(0);
foundWords = cell(0);
for r=1:size(wordClassCells,1)
    values = wordClassCells{r,1};
    foundCategories(size(foundCategories,1)+1,1) = wordClassCells(r,2);
    for v=1:size(values,1) % for each word in the synset/synonyms
        if ~isKey(vocab2cat,char(values{v,1})) % if the word is not in the vocab2category map
            curSiz = vocab2cat.Count+1; % increment size and add the word to M and maps
            M(curSiz,:) = embeddingMap(char(values{v,1}));
            vocab2cat(char(values{v,1})) = wordClassCells(r,2);
            vocab2row(char(values{v,1})) = curSiz; % word only one has 1 row in M
            foundWords{size(foundWords,1)+1,1} = char(values{v,1});
        else % if its there already add the existing entry
            vocab2cat(char(values{v,1})) = vertcat(vocab2cat(char(values{v,1})),wordClassCells(r,2));
        end
        if ~isKey(cat2rows,char(wordClassCells{r,2})) % if the word is not in the cat2rows map add it 
            cat2rows(char(wordClassCells{r,2})) = vocab2row(char(values{v,1}));
        else %% else add add the current row to existing entry
            cat2rows(char(wordClassCells{r,2})) = vertcat(cat2rows(char(wordClassCells{r,2})), vocab2row(char(values{v,1})));
        end
    end
end
c2rKeys=cat2rows.keys; % remove duplicate rows
for c=1:size(c2rKeys,2)
    cat2rows(c2rKeys{1,c}) = unique(cat2rows(c2rKeys{1,c}),'stable');
end

v2cKeys=vocab2cat.keys; % cat maximum number of categories for a word
maxCats = 0;
for c=1:size(v2cKeys,2)
    cats = vocab2cat(v2cKeys{1,c});
    maxCats = max(maxCats,size(cats,1));
end
catsOfWords=cell(size(v2cKeys,1),maxCats); % calculate how many unique sets of categories exist

for c=1:size(v2cKeys,2)
    cats = vocab2cat(v2cKeys{1,c});
    for catIdx=1:maxCats
        if catIdx <=size(cats,1)
            catsOfWords{c,catIdx} = cats{catIdx,1};
        else
            catsOfWords{c,catIdx} = '';
        end
    end
end
numCategories = size(uniqueRowsCA(catsOfWords),1);

foundCategories=unique(foundCategories,'stable');
row2vocab = containers.Map(vocab2row.values,vocab2row.keys);

distM=squareform(pdist(M,'cosine'));

return