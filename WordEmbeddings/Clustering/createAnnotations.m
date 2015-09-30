function [annotations cats] = createAnnotations(foundWords,vocab2cat)

annotations = strrep(foundWords,'_',' ');
for annoIdx=1:size(annotations,1)
    categories = vocab2cat(foundWords{annoIdx,1});
    cats{annoIdx} = intersect(categories,foundCategories); % cats are the categories that exists only in selected categories
    category = '';
    for categoryIdx=1:size(cats{annoIdx},1)
        category = sprintf('%s %s',category,cats{annoIdx}{categoryIdx,1});
    end
    annotations{annoIdx} = [annotations{annoIdx},'_{' category '}'];
end

return