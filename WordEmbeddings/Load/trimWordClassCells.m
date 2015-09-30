function wordClassCells = trimWordClassCells(wordClassCells,embeddingMap)
B=cell(0);
for r=1:size(wordClassCells,1)
    split=strsplit(wordClassCells{r,2},'-');
    if isKey(embeddingMap,char(split(1)))
        curSiz=size(B,1)+1;
        values = wordClassCells{r,1};
        realValues = cell(0);
        for v=1:size(values,2)
            if isKey(embeddingMap,char(values{1,v}))
                realValues{size(realValues,1)+1,1}=values{1,v};
            end
        end
        if size(realValues,1) > 0
            B{curSiz,1} = realValues;
            B{curSiz,2} = wordClassCells{r,2};
        end
    end
end
wordClassCells = B;
return