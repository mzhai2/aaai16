function wordClassCells = loadSemantics(type)
w = load('./data/Semantics.mat');
semanticMap = eval(['w.' type]);
keys = semanticMap.keys;
wordClassCells = cell(length(semanticMap.keys),2);
for i=1:length(keys)
    wordClassCells{i,1} = semanticMap(keys{1,i});
    wordClassCells{i,2} = keys{1,i};
end
return