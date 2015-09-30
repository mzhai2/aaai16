function [distM,vectors,foundWords,foundCategories,numCategories] = getCategories(categories,cat2rows,foundWords,vocab2cat,M)
rows=cell(0);
for r=1:size(categories,1)
    category = categories{r,1};
    if isKey(cat2rows,char(category))
        rows{r,1} = cat2rows(char(category));
    end
end
rows = unique(cell2mat(rows),'stable');
newFoundCategories = cell(0);
newFoundWords = cell(0);
for r=1:size(rows,1)
    word=foundWords{rows(r,1),1};
    newFoundWords = vertcat(newFoundWords,word);
    newFoundCategories = vertcat(newFoundCategories,vocab2cat(word)); % find other categories of words
end
foundCategories = unique(newFoundCategories);
foundWords = unique(newFoundWords,'stable');

v2cKeys=foundWords'; % cat maximum number of categories for a word
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
vectors = M(rows,:);
distM=squareform(pdist(M,'cosine'));
return