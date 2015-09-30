load('data/NYTw2v.mat');
% load('data/Tw2v.mat');

% wordClassCells = loadAnalogies();

% load semantic map into matrix A poss: hypo,sense,synonym
wordClassCellsC = loadSemantics('synonym');
wordClassCellsC = trimWordClassCells(wordClassCellsC,embeddingMap);
wordClassCellsC = trimToMin(wordClassCellsC,3);

[vectorsC,distMC,foundWordsC,foundCategoriesC,numCategoriesC,vocab2cat,vocab2row,cat2rows,row2vocab] = matrixMapBuilder(wordClassCellsC,embeddingMap);
% save('data/SynonymFoundNYTw2v','wordClassCellsC','vectorsC','distMC','foundWordsC','foundCategoriesC','numCategoriesC','vocab2cat','vocab2row','cat2rows','row2vocab','-v7.3');
load 'data/HypoFoundNYTw2v'
wordClassCells = wordClassCellsC;
vectors=vectorsC;
distM=distMC;
foundWords=foundWordsC;
foundCategories=foundCategoriesC;
numCategoriesC=numCategoriesC;

% categories = {'ring-1';'ring-3';'ring-4'}; % for sense
% categories = {'traps';'unfasten';'untruthfulness'}; % for hypo
% categories = {'untruthfulness'};
% [vectors,foundWords,foundCategories,numCategories] = getCategories(categories,cat2rowsC,foundWordsC,vocab2catC,vectorsC);
% clear categories

%% get N random words
% N = 50;
% p = randperm(size(M,1),N);
% vectors = M(p,:);
% newFoundCategories = cell(0);
% newFoundWords = cell(0);
% for r=1:N
%     word=foundWords{p(r),1};
%     newFoundWords = vertcat(newFoundWords,word);
%     categories = vocab2cat(word);
%     for c=1:size(categories,1)
%         newFoundCategories = vertcat(newFoundCategories,categories{c,1});
%     end
% end
% foundCategories = unique(newFoundCategories,'stable');
% foundWords = unique(newFoundWords,'stable');
% numCategories = size(categories,1);
%% get random N categories
% N = 100;
% categoryIndices = randperm(size(foundCategories,1),N);
% clear N
% categories = foundCategories(categoryIndices);
% [vectors,foundWords,foundCategories,numCategories] = getCategories(categories,cat2rows,foundWords,vocab2cat,M);

%% get specific words
% words = {'abdomen'; 'abbot'};
% p=zeros(1);
% for r=1:size(words,1);
%     word = words{r,1};
%     p(1,r) = vocab2row(char(word));
% end
% vectors = M(p,:);
% newFoundCategories = cell(0);
% newFoundWords = cell(0);
% for r=1:size(words,1)
%     word=foundWords{p(r),1};
%     newFoundWords = vertcat(newFoundWords,word);
%     categories = vocab2cat(word);
%     newFoundCategories = vertcat(newFoundCategories,categories);
% end
% foundCategories = unique(newFoundCategories,'stable');
% foundWords = unique(newFoundWords,'stable');
% clear r p word words newFoundWords newFoundCategories
% numCategories = size(categories,1);
%% kpca for vectors
% DIST=distanceMatrix(vectors);
% DIST(DIST==0)=inf;
% DIST=min(DIST);
% para=5*mean(DIST);
% clear DIST
% disp('Performing Gaussian kernel PCA...');
% [kpcaM, ~]=kPCA(vectors,100,'gaussian',para);
% [kpcaMsimp, ~]=kPCA(vectors,100,'simple',para);
%% perform kpca
% DIST=distanceMatrix(M);
% DIST(DIST==0)=inf;
% DIST=min(DIST);
% para=5*mean(DIST);
% clear DIST
% disp('Performing Gaussian kernel PCA...');
% [kpcaM, ~]=kPCA(M,100,'gaussian',para);
% [kpcaMsimp, ~]=kPCA(M,100,'simple',para);
% save('data/NYTw2vSenseN','kpcaM','kpcaMsimp','--apppend');