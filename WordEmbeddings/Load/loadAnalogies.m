function [wordClassCells] = loadAnalogies()
load('./data/Analogies.mat');
wordClassCells = cell(length(Analogies.keys),2);
analogiesKeys = Analogies.keys;
for i=1:length(analogiesKeys)
   wordClassCells{i,1} = Analogies(analogiesKeys{1,i});
   wordClassCells{i,2} = analogiesKeys{1,i};
end
return
% manual add mode
% senseWordCells = {Analogies('3_ice_hockey') Analogies('3_airlines') Analogies('3_family') Analogies('3_basketball') Analogies('3_gram4-superlative') Analogies('2_gram7-past-tense') Analogies('2_ice_hockey') };