addpath('/home/mzhai/WordEmbeddings/Clustering');

load /home/mzhai/WordEmbeddings/data/HypoFoundNYTw2v

mappedX2={};
foundWords=foundWordsC;
vectors=vectorsC;
numCategories=numCategoriesC;
vocab2cat=vocab2cat;
distM=distMC;
distance='cosine';
subscript = true;
showWindows = 2;
visible = false;
savePath = '/home/mzhai/analysis/output/kmedoids/KmeansHypoW2V';
calcKmeans(mappedX2,foundWords,vectors,numCategories,vocab2cat,distM,distance,subscript,showWindows,visible,savePath);
savePath = '/home/mzhai/analysis/output/kmedoids/KmedoidsHypoW2V';
calcKmedoids(mappedX2,foundWords,vectors,numCategories,vocab2cat,distM,subscript,showWindows,visible,savePath);
savePath = '/home/mzhai/analysis/output/kmedoids/FCMHypoW2V';
calcFCM(mappedX2,foundWords,vectors,numCategories,vocab2cat,distM,subscript,showWindows,visible,savePath);

load /home/mzhai/WordEmbeddings/data/SenseFoundNYTw2v

mappedX2={};
foundWords=foundWordsC;
vectors=vectorsC;
numCategories=numCategoriesC;
vocab2cat=vocab2cat;
distM=distMC;
distance='cosine';
subscript = true;
showWindows = 2;
visible = false;

savePath = '/home/mzhai/analysis/output/kmedoids/KmeansSenseW2V';
calcKmeans(mappedX2,foundWords,vectors,numCategories,vocab2cat,distM,distance,subscript,showWindows,visible,savePath);
savePath = '/home/mzhai/analysis/output/kmedoids/KmedoidsSenseW2V';
calcKmedoids(mappedX2,foundWords,vectors,numCategories,vocab2cat,distM,subscript,showWindows,visible,savePath);
savePath = '/home/mzhai/analysis/output/kmedoids/FCMSenseW2V';
calcFCM(mappedX2,foundWords,vectors,numCategories,vocab2cat,distM,subscript,showWindows,visible,savePath);
